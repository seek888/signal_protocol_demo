import 'dart:typed_data';
import '../crypto/curve25519.dart';
import '../crypto/hkdf.dart';
import '../ecc/ec_key_pair.dart';
import '../ecc/identity_key_pair.dart';
import 'prekey_bundle.dart';

/// Result of an X3DH handshake.
class X3DHResult {
  /// The shared secret derived by HKDF.
  final Uint8List sharedSecret;

  /// The ephemeral key pair used by the initiator (Alice's EK).
  final ECKeyPair? ephemeralKeyPair;

  /// The associated data for message authentication.
  final Uint8List associatedData;

  X3DHResult({
    required this.sharedSecret,
    this.ephemeralKeyPair,
    required this.associatedData,
  });
}

/// X3DH key agreement (Signal Protocol §3.4 / §3.5).
class X3DHHandshake {
  /// Alice (initiator) side.
  ///
  /// Computes DH1–DH4 and derives the shared secret via HKDF.
  static Future<X3DHResult> initiate({
    required IdentityKeyPair ourIdentityKey,
    required PreKeyBundle theirBundle,
  }) async {
    // Generate ephemeral key pair EK_A.
    final ephemeralKeyPair = await Curve25519.generateKeyPair();

    // DH1 = DH(IK_A.priv, SPK_B.pub)
    final dh1 = await Curve25519.calculateAgreement(
      privateKey: ourIdentityKey.privateKey,
      publicKey: theirBundle.signedPreKey,
      label: 'DH1',
    );

    // DH2 = DH(EK_A.priv, IK_B.pub)
    final dh2 = await Curve25519.calculateAgreement(
      privateKey: ephemeralKeyPair.privateKey,
      publicKey: theirBundle.identityKey,
      label: 'DH2',
    );

    // DH3 = DH(EK_A.priv, SPK_B.pub)
    final dh3 = await Curve25519.calculateAgreement(
      privateKey: ephemeralKeyPair.privateKey,
      publicKey: theirBundle.signedPreKey,
      label: 'DH3',
    );

    // DH4 = DH(EK_A.priv, OPK_B.pub) — optional.
    Uint8List? dh4;
    if (theirBundle.oneTimePreKey != null) {
      dh4 = await Curve25519.calculateAgreement(
        privateKey: ephemeralKeyPair.privateKey,
        publicKey: theirBundle.oneTimePreKey!,
        label: 'DH4',
      );
    }

    // F = 0xFF * 32 || DH1 || DH2 || DH3 [|| DH4]
    final combinedInput = <int>[];
    combinedInput.addAll(List.filled(32, 0xFF));
    combinedInput.addAll(dh1);
    combinedInput.addAll(dh2);
    combinedInput.addAll(dh3);
    if (dh4 != null) combinedInput.addAll(dh4);

    // HKDF with info "WhisperText" and no salt (zero salt).
    final info = Uint8List.fromList('WhisperText'.codeUnits);
    final sharedSecret = await HkdfSha256.deriveSecrets(
      ikm: Uint8List.fromList(combinedInput),
      info: info,
      length: 32,
    );

    // Associated data = IK_A.pub || IK_B.pub
    final ad = <int>[];
    ad.addAll(ourIdentityKey.publicKey);
    ad.addAll(theirBundle.identityKey);

    return X3DHResult(
      sharedSecret: sharedSecret,
      ephemeralKeyPair: ephemeralKeyPair,
      associatedData: Uint8List.fromList(ad),
    );
  }

  /// Bob (responder) side.
  ///
  /// Performs the symmetric DH calculations using Bob's private keys.
  static Future<X3DHResult> respond({
    required IdentityKeyPair ourIdentityKey,
    required Uint8List ourSignedPreKeyPrivate,
    required Uint8List ourSignedPreKeyPublic,
    Uint8List? ourOneTimePreKeyPrivate,
    Uint8List? theirIdentityKeyPublic,
    required Uint8List theirEphemeralKeyPublic,
  }) async {
    // DH1 = DH(SPK_B.priv, IK_A.pub)
    final dh1 = await Curve25519.calculateAgreement(
      privateKey: ourSignedPreKeyPrivate,
      publicKey: theirIdentityKeyPublic!,
      label: 'DH1',
    );

    // DH2 = DH(IK_B.priv, EK_A.pub)
    final dh2 = await Curve25519.calculateAgreement(
      privateKey: ourIdentityKey.privateKey,
      publicKey: theirEphemeralKeyPublic,
      label: 'DH2',
    );

    // DH3 = DH(SPK_B.priv, EK_A.pub)
    final dh3 = await Curve25519.calculateAgreement(
      privateKey: ourSignedPreKeyPrivate,
      publicKey: theirEphemeralKeyPublic,
      label: 'DH3',
    );

    // DH4 — optional.
    Uint8List? dh4;
    if (ourOneTimePreKeyPrivate != null) {
      dh4 = await Curve25519.calculateAgreement(
        privateKey: ourOneTimePreKeyPrivate,
        publicKey: theirEphemeralKeyPublic,
        label: 'DH4',
      );
    }

    final combinedInput = <int>[];
    combinedInput.addAll(List.filled(32, 0xFF));
    combinedInput.addAll(dh1);
    combinedInput.addAll(dh2);
    combinedInput.addAll(dh3);
    if (dh4 != null) combinedInput.addAll(dh4);

    final info = Uint8List.fromList('WhisperText'.codeUnits);
    final sharedSecret = await HkdfSha256.deriveSecrets(
      ikm: Uint8List.fromList(combinedInput),
      info: info,
      length: 32,
    );

    final ad = <int>[];
    ad.addAll(theirIdentityKeyPublic);
    ad.addAll(ourIdentityKey.publicKey);

    return X3DHResult(
      sharedSecret: sharedSecret,
      associatedData: Uint8List.fromList(ad),
    );
  }
}
