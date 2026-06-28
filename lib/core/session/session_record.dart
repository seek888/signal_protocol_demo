import 'session_state.dart';
import '../protocol/protocol_constants.dart';

/// A session record holds a current [SessionState] and up to
/// [ProtocolConstants.maxArchivedStates] previous states.
class SessionRecord {
  SessionState current;
  final List<SessionState> _previousStates = [];

  SessionRecord(this.current);

  /// Archived (previous) states.
  List<SessionState> get previousStates =>
      List.unmodifiable(_previousStates);

  /// Archive the current state and set a new one.
  void promote(SessionState newCurrent) {
    _previousStates.insert(0, current);
    if (_previousStates.length > ProtocolConstants.maxArchivedStates) {
      _previousStates.removeLast();
    }
    current = newCurrent;
  }

  /// Check whether this record has a current state.
  bool get hasSession => current.ratchetState.senderChainKey.index >= 0;
}
