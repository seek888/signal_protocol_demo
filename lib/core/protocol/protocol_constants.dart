/// Signal Protocol constants.
class ProtocolConstants {
  ProtocolConstants._();

  /// Maximum number of message keys that can be skipped in a single chain.
  static const int maxSkip = 2000;

  /// Maximum number of receiver chains kept in a ratchet state.
  static const int maxReceiverChains = 5;

  /// Maximum number of archived session states.
  static const int maxArchivedStates = 40;

  /// Public key serialization version byte (Curve25519).
  static const int djbType = 0x05;

  /// HKDF info string for root key derivation.
  static const String kdfInfoRootKey = 'WhisperRatchet';

  /// HKDF info string for chain key derivation.
  static const String kdfInfoChainKey = 'WhisperMessage';
}
