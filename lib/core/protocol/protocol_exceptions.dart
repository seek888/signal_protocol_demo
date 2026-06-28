/// Signal Protocol exceptions.

class ProtocolException implements Exception {
  final String message;
  ProtocolException(this.message);

  @override
  String toString() => '$runtimeType: $message';
}

class InvalidMessageException extends ProtocolException {
  InvalidMessageException([String message = 'Invalid message']) : super(message);
}

class UntrustedIdentityException extends ProtocolException {
  final String identityKey;
  UntrustedIdentityException(this.identityKey)
      : super('Untrusted identity: $identityKey');
}

class DuplicateMessageException extends ProtocolException {
  DuplicateMessageException([String message = 'Duplicate message'])
      : super(message);
}

class NoSessionException extends ProtocolException {
  NoSessionException([String message = 'No session found']) : super(message);
}

class InvalidKeyIdException extends ProtocolException {
  final int keyId;
  InvalidKeyIdException(this.keyId) : super('Invalid key ID: $keyId');
}

class InvalidKeyException extends ProtocolException {
  InvalidKeyException([String message = 'Invalid key']) : super(message);
}

class StaleKeyExchangeException extends ProtocolException {
  StaleKeyExchangeException([String message = 'Stale key exchange'])
      : super(message);
}

class OverrodeSignalException extends ProtocolException {
  OverrodeSignalException([String message = 'Overrode signal'])
      : super(message);
}
