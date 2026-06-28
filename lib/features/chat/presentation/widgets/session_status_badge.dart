import 'package:flutter/material.dart';

class SessionStatusBadge extends StatelessWidget {
  final int ratchetStepCount;
  final int messageCount;

  const SessionStatusBadge({
    super.key,
    required this.ratchetStepCount,
    required this.messageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.green.shade900.withValues(alpha: 0.3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.lock, size: 14, color: Colors.green),
          const SizedBox(width: 6),
          Text(
            'End-to-End Encrypted',
            style: TextStyle(
              fontSize: 12,
              color: Colors.green.shade300,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 16),
          _buildChip('Messages', messageCount, Colors.blue),
          const SizedBox(width: 8),
          _buildChip('Ratchet Steps', ratchetStepCount, Colors.purple),
        ],
      ),
    );
  }

  Widget _buildChip(String label, int value, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$label: ',
          style: TextStyle(fontSize: 11, color: Colors.grey.shade400),
        ),
        Text(
          '$value',
          style: TextStyle(
            fontSize: 11,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
