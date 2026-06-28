import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../viewmodels/chat_viewmodel.dart';
import '../viewmodels/chat_state.dart';
import '../widgets/message_bubble.dart';
import '../widgets/message_input.dart';
import '../widgets/session_status_badge.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatViewModelProvider);
    _scrollToBottom();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Signal Demo'),
            Text(
              state.isSessionEstablished
                  ? '🔒 End-to-End Encrypted'
                  : '⚠️ No Session',
              style: const TextStyle(fontSize: 11),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.key),
            tooltip: 'X3DH Handshake',
            onPressed: state.isEstablishing
                ? null
                : () => _handleEstablishSession(context, ref),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Reset Session',
            onPressed: () => ref.read(chatViewModelProvider.notifier).resetSession(),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'x3dh':
                  context.push('/visualization/x3dh');
                  break;
                case 'ratchet':
                  context.push('/visualization/ratchet');
                  break;
                case 'pipeline':
                  context.push('/visualization/pipeline');
                  break;
              }
            },
            itemBuilder: (_) => const [
              PopupItem(value: 'x3dh', icon: Icons.handshake, label: 'X3DH Handshake'),
              PopupItem(value: 'ratchet', icon: Icons.sync, label: 'Double Ratchet'),
              PopupItem(value: 'pipeline', icon: Icons.account_tree, label: 'Crypto Pipeline'),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          if (state.isSessionEstablished)
            SessionStatusBadge(
              ratchetStepCount: state.ratchetStepCount,
              messageCount: state.messages.length,
            ),
          if (state.isSessionEstablished)
            _buildSenderSwitch(context, ref, state),
          if (state.errorMessage != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Colors.red.shade900.withValues(alpha: 0.3),
              child: Row(
                children: [
                  const Icon(Icons.error, color: Colors.red, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      state.errorMessage!,
                      style: const TextStyle(fontSize: 12, color: Colors.red),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, size: 14),
                    onPressed: () =>
                        ref.read(chatViewModelProvider.notifier).clearError(),
                  ),
                ],
              ),
            ),
          Expanded(
            child: !state.isSessionEstablished && state.messages.isEmpty
                ? _buildWelcomeView(context, ref, state)
                : ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      final msg = state.messages[index];
                      return MessageBubble(
                        message: msg,
                        onTap: () => _showMessageDetail(context, msg),
                      );
                    },
                  ),
          ),
          MessageInput(onSend: (text) => _handleSend(context, ref, text)),
        ],
      ),
    );
  }

  Widget _buildSenderSwitch(BuildContext context, WidgetRef ref, ChatState state) {
    final isAlice = state.currentSender == 'alice';
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            isAlice ? Icons.person : Icons.person_outline,
            size: 16,
            color: isAlice ? Colors.blue : Colors.grey,
          ),
          const SizedBox(width: 6),
          Text(
            isAlice ? 'Alice 发送' : 'Bob 发送',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isAlice ? Colors.blue : Colors.green,
            ),
          ),
          const Spacer(),
          Text(
            'A: ${_getAliceCount(ref)}条  B: ${_getBobCount(ref)}条',
            style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => ref.read(chatViewModelProvider.notifier).switchSender(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: isAlice ? Colors.blue.shade700 : Colors.green.shade700,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    isAlice ? 'Alice' : 'Bob',
                    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.swap_horiz, size: 14, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  int _getAliceCount(WidgetRef ref) {
    return ref.read(chatViewModelProvider).messages.where((m) => m.direction == UIMessageDirection.sent && m.status != MessageStatus.pending).length;
  }

  int _getBobCount(WidgetRef ref) {
    return ref.read(chatViewModelProvider).messages.where((m) => m.direction == UIMessageDirection.received && m.status != MessageStatus.pending).length;
  }

  Widget _buildWelcomeView(BuildContext context, WidgetRef ref, ChatState state) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_outline,
              size: 72,
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 24),
            Text(
              'Signal Protocol Demo',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            const Text(
              'Establish an encrypted session to start messaging.\n'
              'Tap the key icon to perform X3DH handshake.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: state.isEstablishing
                  ? null
                  : () => _handleEstablishSession(context, ref),
              icon: state.isEstablishing
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.key),
              label: Text(state.isEstablishing ? 'Establishing...' : 'Establish Session'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleEstablishSession(
      BuildContext context, WidgetRef ref) async {
    await ref.read(chatViewModelProvider.notifier).establishSession();
    final state = ref.read(chatViewModelProvider);
    if (state.isSessionEstablished && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '✅ X3DH Handshake Complete!\n'
            'Shared Secret: ${state.sharedSecretHex?.substring(0, 32)}...',
          ),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> _handleSend(
      BuildContext context, WidgetRef ref, String text) async {
    await ref.read(chatViewModelProvider.notifier).sendMessage(text);
  }

  void _showMessageDetail(BuildContext context, ChatMessage msg) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            controller: scrollController,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Encryption Details',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              _buildDetailRow('Direction',
                  msg.direction == UIMessageDirection.sent ? 'Alice → Bob' : 'Bob → Alice'),
              const SizedBox(height: 8),
              const Text('Step 1 — Plaintext', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
              const SizedBox(height: 4),
              _buildCodeBlock(msg.text, Colors.green),
              const SizedBox(height: 12),
              if (msg.messageKeyHex != null) ...[
                const Text('Step 2 — Message Key (HKDF derived)', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                const SizedBox(height: 4),
                _buildCodeBlock(msg.messageKeyHex!, Colors.blue),
                const SizedBox(height: 12),
              ],
              if (msg.ciphertextHex != null) ...[
                const Text('Step 3 — AES-256-GCM Encrypt → Ciphertext', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                const SizedBox(height: 4),
                _buildCodeBlock(msg.ciphertextHex!, Colors.orange),
              ],

              const SizedBox(height: 24),
              // === 网络传输 ===
              _buildSectionHeader('📡 Mock Server (Transport)', Colors.grey),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade700),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.cloud_upload, size: 16, color: Colors.grey),
                    Expanded(child: Container(height: 2, color: Colors.grey.shade600)),
                    const Icon(Icons.cloud_download, size: 16, color: Colors.grey),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              // === Bob 解密流程 ===
              _buildSectionHeader('🟢 Bob (Receiver)', Colors.green),
              const SizedBox(height: 8),
              if (msg.ciphertextHex != null) ...[
                const Text('Step 4 — Received Ciphertext', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                const SizedBox(height: 4),
                _buildCodeBlock(msg.ciphertextHex!, Colors.orange),
                const SizedBox(height: 12),
              ],
              if (msg.messageKeyHex != null) ...[
                const Text('Step 5 — Derive Same Message Key', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                const SizedBox(height: 4),
                _buildCodeBlock(msg.messageKeyHex!, Colors.blue),
                const SizedBox(height: 12),
              ],
              const Text('Step 6 — AES-256-GCM Decrypt → Plaintext', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
              const SizedBox(height: 4),
              if (msg.status == MessageStatus.decrypted)
                _buildCodeBlock(msg.text, Colors.green)
              else if (msg.status == MessageStatus.pending)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.amber.withValues(alpha: 0.3)),
                  ),
                  child: const Row(children: [
                    SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 1.5, color: Colors.amber)),
                    SizedBox(width: 8),
                    Text('Decrypting...', style: TextStyle(color: Colors.amber, fontSize: 12)),
                  ]),
                )
              else
                _buildCodeBlock('(encrypted)', Colors.grey),

              const SizedBox(height: 24),
              if (msg.status == MessageStatus.decrypted) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green.shade900.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.green),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle, color: Colors.green),
                      SizedBox(width: 8),
                      Text('✅ Decryption Successful — Alice plaintext == Bob plaintext',
                          style: TextStyle(color: Colors.green, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(label, style: TextStyle(fontSize: 12, color: Colors.grey.shade400)),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 12))),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, Color color) {
    return Row(
      children: [
        Container(width: 4, height: 20, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
        const SizedBox(width: 8),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: color)),
      ],
    );
  }

  Widget _buildCodeBlock(String content, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        content,
        style: TextStyle(
          fontFamily: 'monospace',
          fontSize: 11,
          color: color,
        ),
      ),
    );
  }
}

class PopupItem extends PopupMenuEntry<String> {
  final String value;
  final IconData icon;
  final String label;

  const PopupItem({
    super.key,
    required this.value,
    required this.icon,
    required this.label,
  });

  @override
  double get height => kMinInteractiveDimension;

  @override
  bool represents(String? e) => e == value;

  @override
  State<PopupItem> createState() => _PopupItemState();
}

class _PopupItemState extends State<PopupItem> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuItem<String>(
      value: widget.value,
      child: Row(
        children: [
          Icon(widget.icon, size: 18),
          const SizedBox(width: 8),
          Text(widget.label),
        ],
      ),
    );
  }
}
