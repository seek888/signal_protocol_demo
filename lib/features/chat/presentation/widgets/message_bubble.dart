import 'package:flutter/material.dart';
import '../viewmodels/chat_state.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final VoidCallback? onTap;

  const MessageBubble({super.key, required this.message, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isSent = message.direction == UIMessageDirection.sent;
    final isPending = message.status == MessageStatus.pending;

    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            gradient: isSent
                ? LinearGradient(
                    colors: [Colors.blue.shade700, Colors.blue.shade600],
                  )
                : LinearGradient(
                    colors: [Colors.grey.shade800, Colors.grey.shade700],
                  ),
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(16),
              topRight: const Radius.circular(16),
              bottomLeft: isSent ? const Radius.circular(16) : Radius.zero,
              bottomRight: isSent ? Radius.zero : const Radius.circular(16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isPending)
                    const SizedBox(
                      width: 12,
                      height: 12,
                      child: CircularProgressIndicator(strokeWidth: 1.5, color: Colors.white54),
                    )
                  else
                    Icon(
                      isSent
                          ? (message.status == MessageStatus.encrypted ? Icons.lock : Icons.lock_open)
                          : (message.status == MessageStatus.decrypted ? Icons.lock_open : Icons.lock),
                      size: 12,
                      color: isSent ? Colors.white70 : Colors.grey.shade400,
                    ),
                  const SizedBox(width: 6),
              Flexible(
                child: isPending
                    ? Text(
                        ' ciphertext: ${message.ciphertextHex?.split(' ').take(4).join(' ')}...',
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
                          fontFamily: 'monospace',
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    : Text(
                        message.text,
                        style: TextStyle(
                          color: isSent ? Colors.white : Colors.grey.shade100,
                          fontSize: 15,
                        ),
                      ),
              ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!isPending) ...[
                    Text(
                      _formatTime(message.timestamp),
                      style: TextStyle(
                        fontSize: 10,
                        color: isSent ? Colors.white60 : Colors.grey.shade500,
                      ),
                    ),
                  ] else ...[
                    Text(
                      'Bob 解密中...',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white54,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                  if (message.ciphertextHex != null && !isPending) ...[
                    const SizedBox(width: 8),
                    Icon(
                      Icons.code,
                      size: 10,
                      color: isSent ? Colors.white60 : Colors.grey.shade500,
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(DateTime dt) {
    return '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }
}
