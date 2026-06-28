import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RatchetVisualizationPage extends StatefulWidget {
  const RatchetVisualizationPage({super.key});

  @override
  State<RatchetVisualizationPage> createState() => _RatchetVisualizationPageState();
}

class _RatchetVisualizationPageState extends State<RatchetVisualizationPage>
    with TickerProviderStateMixin {
  late AnimationController _gearController;
  late AnimationController _pulseController;
  int _messageCount = 0;
  int _dhRatchetCount = 0;
  final List<_RatchetMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    _gearController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _gearController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _simulateEncrypt() {
    setState(() {
      _messageCount++;
      _messages.insert(
        0,
        _RatchetMessage(
          index: _messageCount,
          chainKey: _generateHex(8),
          msgKey: _generateHex(8),
          ciphertext: _generateHex(16),
          isDHStep: false,
        ),
      );
    });
    _gearController.forward(from: 0);
    _pulseController.forward(from: 0);
  }

  void _simulateDHRatchet() {
    setState(() {
      _dhRatchetCount++;
      _messageCount++;
      _messages.insert(
        0,
        _RatchetMessage(
          index: _messageCount,
          chainKey: _generateHex(8),
          msgKey: _generateHex(8),
          ciphertext: _generateHex(16),
          isDHStep: true,
          newRootKey: _generateHex(8),
        ),
      );
    });
    _gearController.forward(from: 0);
  }

  String _generateHex(int words) {
    final hex = [
      'a1', 'b2', 'c3', 'd4', 'e5', 'f6', '7a', '8b',
      '9c', '0d', '1e', '2f', '3a', '4b', '5c', '6d'
    ];
    final buf = StringBuffer();
    for (var i = 0; i < words; i++) {
      if (i > 0) buf.write(' ');
      buf.writeAll(hex.sublist(i % hex.length, (i % hex.length) + 2));
    }
    return buf.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Double Ratchet'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            tooltip: 'Trigger DH Ratchet',
            onPressed: _simulateDHRatchet,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildKeyHierarchy(),
            const SizedBox(height: 24),
            _buildRatchetDiagram(),
            const SizedBox(height: 24),
            _buildMessageKeyList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _simulateEncrypt,
        icon: const Icon(Icons.lock),
        label: const Text('Encrypt Message'),
      ),
    );
  }

  Widget _buildKeyHierarchy() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.account_tree, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Text('Key Hierarchy', style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 20),
            // Root Key
            _buildKeyNode('Root Key', '32 bytes', Colors.red, isTop: true),
            const SizedBox(height: 8),
            // Connecting line
            Center(child: Container(width: 2, height: 20, color: Colors.grey.shade600)),
            // Chain Keys
            Row(
              children: [
                Expanded(child: _buildKeyNode('Send Chain', '32 bytes', Colors.blue)),
                const SizedBox(width: 12),
                Expanded(child: _buildKeyNode('Recv Chain', '32 bytes', Colors.green)),
              ],
            ),
            const SizedBox(height: 8),
            Center(child: Container(width: 2, height: 20, color: Colors.grey.shade600)),
            // Message keys
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _buildKeyNode('Msg Key 0', '80 bytes', Colors.blue.shade300, small: true),
                      const SizedBox(height: 4),
                      _buildKeyNode('Msg Key 1', '80 bytes', Colors.blue.shade300, small: true),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    children: [
                      _buildKeyNode('Msg Key 0', '80 bytes', Colors.green.shade300, small: true),
                      const SizedBox(height: 4),
                      _buildKeyNode('Msg Key 1', '80 bytes', Colors.green.shade300, small: true),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyNode(String label, String size, Color color,
      {bool isTop = false, bool small = false}) {
    return AnimatedBuilder(
      animation: _pulseController,
      builder: (context, child) {
        final scale = isTop ? 1.0 + _pulseController.value * 0.05 : 1.0;
        return Transform.scale(scale: scale, child: child);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: small ? 8 : 12,
          vertical: small ? 6 : 10,
        ),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.5)),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: small ? 10 : 12,
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              size,
              style: TextStyle(
                fontSize: small ? 8 : 10,
                color: Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatchetDiagram() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.settings, color: Colors.purple),
                const SizedBox(width: 8),
                Text('Ratchet State', style: Theme.of(context).textTheme.titleMedium),
                const Spacer(),
                _buildStatChip('Messages', _messageCount, Colors.blue),
                const SizedBox(width: 8),
                _buildStatChip('DH Steps', _dhRatchetCount, Colors.purple),
              ],
            ),
            const SizedBox(height: 20),
            // Animated gear
            Center(
              child: AnimatedBuilder(
                animation: _gearController,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _gearController.value * 2.0,
                    child: child,
                  );
                },
                child: Icon(
                  Icons.settings,
                  size: 64,
                  color: Colors.purple.withValues(alpha: 0.5),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildRatchetFlow(),
          ],
        ),
      ),
    );
  }

  Widget _buildRatchetFlow() {
    return Column(
      children: [
        _buildFlowStep(
          'Chain Key',
          'HMAC-SHA256(key, 0x01)',
          '→ Message Key',
          Colors.blue,
        ),
        const SizedBox(height: 8),
        _buildFlowStep(
          'Chain Key',
          'HMAC-SHA256(key, 0x02)',
          '→ Next Chain Key',
          Colors.teal,
        ),
        const SizedBox(height: 8),
        _buildFlowStep(
          'Root Key + DH Output',
          'HKDF-SHA256',
          '→ New Root + New Chain',
          Colors.red,
        ),
      ],
    );
  }

  Widget _buildFlowStep(String input, String operation, String output, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(input, style: TextStyle(fontSize: 11, color: color)),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              operation,
              style: TextStyle(fontSize: 10, fontFamily: 'monospace', color: color),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Text(
              output,
              style: TextStyle(fontSize: 11, color: Colors.grey.shade300),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageKeyList() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Message Keys', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            if (_messages.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'No messages yet.\nTap "Encrypt Message" to see the ratchet in action.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              )
            else
              ..._messages.map((msg) => _buildMessageKeyTile(msg)),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageKeyTile(_RatchetMessage msg) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: msg.isDHStep
            ? Colors.purple.withValues(alpha: 0.1)
            : Colors.blue.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: msg.isDHStep ? Colors.purple.withValues(alpha: 0.3) : Colors.transparent,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (msg.isDHStep)
                const Icon(Icons.sync, size: 14, color: Colors.purple)
              else
                const Icon(Icons.lock, size: 14, color: Colors.blue),
              const SizedBox(width: 6),
              Text(
                'Message #${msg.index}',
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              ),
              if (msg.isDHStep) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.purple.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'DH RATCHET',
                    style: TextStyle(fontSize: 9, color: Colors.purple, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
          _buildHexRow('Chain Key', msg.chainKey),
          _buildHexRow('Message Key', msg.msgKey),
          _buildHexRow('Ciphertext', msg.ciphertext),
          if (msg.newRootKey != null)
            _buildHexRow('New Root Key', msg.newRootKey!, Colors.red),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.1);
  }

  Widget _buildHexRow(String label, String hex, [Color? color]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              '$label:',
              style: TextStyle(fontSize: 10, color: Colors.grey.shade400),
            ),
          ),
          Expanded(
            child: Text(
              hex,
              style: TextStyle(
                fontSize: 10,
                fontFamily: 'monospace',
                color: color ?? Colors.grey.shade300,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatChip(String label, int value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label: ',
            style: TextStyle(fontSize: 10, color: Colors.grey.shade400),
          ),
          Text(
            '$value',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _RatchetMessage {
  final int index;
  final String chainKey;
  final String msgKey;
  final String ciphertext;
  final bool isDHStep;
  final String? newRootKey;

  _RatchetMessage({
    required this.index,
    required this.chainKey,
    required this.msgKey,
    required this.ciphertext,
    required this.isDHStep,
    this.newRootKey,
  });
}
