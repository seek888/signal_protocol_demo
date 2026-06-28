import 'dart:typed_data';
import 'package:cryptography/cryptography.dart';
import '../ecc/ec_key_pair.dart';
import '../protocol/protocol_constants.dart';
import 'crypto_provider.dart';

/// X25519 key exchange operations using the `cryptography` package.
class Curve25519 {
  static final _x25519 = X25519();

  /// Global callback that, if set, receives DH operation events.
  static CryptoStepCallback? callback;

  /// Generate a new X25519 key pair.
  static Future<ECKeyPair> generateKeyPair() async {
    final keyPair = await _x25519.newKeyPair();
    // ignore: unnecessary_cast
    final keyPairData = await keyPair.extract() as SimpleKeyPairData;
    final pubKey = keyPairData.publicKey; // SimplePublicKey

    final publicKeyBytes = Uint8List.fromList(pubKey.bytes);
    final privateKeyBytes = Uint8List.fromList(keyPairData.bytes);

    // Serialize public key with 0x05 prefix.
    final serializedPub = Uint8List(33);
    serializedPub[0] = ProtocolConstants.djbType;
    serializedPub.setRange(1, 33, publicKeyBytes);

    return ECKeyPair(
      publicKey: serializedPub,
      privateKey: privateKeyBytes,
    );
  }

  /// Compute the shared secret between [privateKey] (32 raw bytes)
  /// and [publicKey] (33 bytes with 0x05 prefix or 32 raw bytes).
  static Future<Uint8List> calculateAgreement({
    required Uint8List privateKey,
    required Uint8List publicKey,
    String label = 'DH',
  }) async {
    final pubKeyBytes = deserializePublicKey(publicKey);

    // Construct a SimpleKeyPairData from the raw private key + remote public key.
    final keyPairData = SimpleKeyPairData(
      privateKey,
      publicKey: SimplePublicKey(pubKeyBytes, type: KeyPairType.x25519),
      type: KeyPairType.x25519,
    );

    final secretKey = await _x25519.sharedSecretKey(
      keyPair: keyPairData,
      remotePublicKey: SimplePublicKey(pubKeyBytes, type: KeyPairType.x25519),
    );

    final output = Uint8List.fromList(await secretKey.extractBytes());

    callback?.onDHCompute(DHOperation(
      label: label,
      privateKey: privateKey,
      publicKey: publicKey,
      output: output,
    ));

    return output;
  }

  /// Verify and strip the 0x05 prefix from a serialised public key.
  static Uint8List deserializePublicKey(Uint8List key) {
    if (key.length == 33) {
      if (key[0] != ProtocolConstants.djbType) {
        throw ArgumentError(
            'Invalid public key prefix: 0x${key[0].toRadixString(16)}');
      }
      return Uint8List.fromList(key.sublist(1));
    } else if (key.length == 32) {
      return key;
    }
    throw ArgumentError('Invalid public key length: ${key.length}');
  }

  /// Prepend the 0x05 prefix to a raw 32-byte public key.
  static Uint8List serializePublicKey(Uint8List rawKey) {
    if (rawKey.length != 32) {
      throw ArgumentError('Raw key must be 32 bytes, got ${rawKey.length}');
    }
    final out = Uint8List(33);
    out[0] = ProtocolConstants.djbType;
    out.setRange(1, 33, rawKey);
    return out;
  }
}
