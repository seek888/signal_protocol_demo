import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CryptoPipelinePage extends StatelessWidget {
  const CryptoPipelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Encryption Pipeline')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'End-to-End Data Flow', Icons.account_tree),
            const SizedBox(height: 16),
            _buildPipelineDiagram(context),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Key Statistics', Icons.bar_chart),
            const SizedBox(height: 16),
            _buildStatsGrid(context),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Protocol State Machine', Icons.memory),
            const SizedBox(height: 16),
            _buildStateMachine(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary, size: 20),
        const SizedBox(width: 8),
        Text(title, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }

  Widget _buildPipelineDiagram(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Alice side
            _buildPipelineNode(
              'Alice',
              'Sender',
              Colors.blue,
              [
                _PipelineStep('1. Plaintext Input', Icons.text_fields, Colors.grey),
                _PipelineStep('2. Chain Ratchet Step', Icons.sync, Colors.teal),
                _PipelineStep('3. AES-256-GCM Encrypt', Icons.lock, Colors.orange),
                _PipelineStep('4. SignalMessage Encode', Icons.code, Colors.purple),
              ],
            ),
            const SizedBox(height: 12),
            // Server
            _buildPipelineNode(
              'Mock Server',
              'Relay',
              Colors.grey,
              [
                _PipelineStep('5. Message Queue', Icons.queue, Colors.grey),
                _PipelineStep('6. Forward to Recipient', Icons.forward, Colors.grey),
              ],
            ),
            const SizedBox(height: 12),
            // Bob side
            _buildPipelineNode(
              'Bob',
              'Receiver',
              Colors.green,
              [
                _PipelineStep('7. SignalMessage Decode', Icons.code, Colors.purple),
                _PipelineStep('8. DH Ratchet Check', Icons.sync, Colors.teal),
                _PipelineStep('9. Chain Key Step', Icons.key, Colors.blue),
                _PipelineStep('10. AES-256-GCM Decrypt', Icons.lock_open, Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPipelineNode(
    String name,
    String role,
    Color color,
    List<_PipelineStep> steps,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: color.withValues(alpha: 0.3),
                child: Text(name[0], style: TextStyle(color: color, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
                  Text(role, style: TextStyle(fontSize: 10, color: Colors.grey.shade400)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...steps.map((step) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  children: [
                    Icon(step.icon, size: 14, color: step.color),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        step.label,
                        style: const TextStyle(fontSize: 11),
                      ),
                    ),
                    Icon(Icons.check_circle, size: 12, color: Colors.green.withValues(alpha: 0.5)),
                  ],
                ),
              )),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.05);
  }

  Widget _buildStatsGrid(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.3,
      children: [
        _buildStatCard('Total Messages', '0', Icons.message, Colors.blue),
        _buildStatCard('Ratchet Steps', '0', Icons.sync, Colors.purple),
        _buildStatCard('DH Operations', '0', Icons.swap_horiz, Colors.teal),
        _buildStatCard('AES Encrypts', '0', Icons.lock, Colors.orange),
        _buildStatCard('AES Decrypts', '0', Icons.lock_open, Colors.green),
        _buildStatCard('OPK Remaining', '100', Icons.vpn_key, Colors.red),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStateMachine(BuildContext context) {
    final states = [
      ('Uninitialized', Colors.grey, true),
      ('X3DH Handshake', Colors.amber, false),
      ('Session Active', Colors.green, false),
      ('DH Ratcheting', Colors.purple, false),
      ('OPK Exhausted', Colors.red, false),
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: states.map((state) {
            final (label, color, active) = state;
            return Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: active ? color : color.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                    border: Border.all(color: color),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    color: active ? color : Colors.grey.shade500,
                    fontWeight: active ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
                if (active) ...[
                  const Spacer(),
                  Text(
                    '← CURRENT',
                    style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.bold),
                  ),
                ],
              ],
            ).animate().fadeIn(delay: 200.ms);
          }).toList(),
        ),
      ),
    );
  }
}

class _PipelineStep {
  final String label;
  final IconData icon;
  final Color color;
  _PipelineStep(this.label, this.icon, this.color);
}
