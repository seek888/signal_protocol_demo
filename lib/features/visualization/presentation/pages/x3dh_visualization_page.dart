import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/di/injection.dart';
import '../../../../domain/services/signal_session_service.dart';

class X3DHVisualizationPage extends ConsumerStatefulWidget {
  const X3DHVisualizationPage({super.key});

  @override
  ConsumerState<X3DHVisualizationPage> createState() => _X3DHVisualizationPageState();
}

class _X3DHVisualizationPageState extends ConsumerState<X3DHVisualizationPage> {
  final _signalService = getIt<SignalSessionService>();
  int _currentStep = 0;
  bool _isRunning = false;

  final _steps = const [
    'Generate Identity Keys',
    'Generate Ephemeral Key (EK_A)',
    'Compute DH1 = DH(IK_A, SPK_B)',
    'Compute DH2 = DH(EK_A, IK_B)',
    'Compute DH3 = DH(EK_A, SPK_B)',
    'HKDF Derive Shared Secret (SK)',
  ];

  Future<void> _runHandshake() async {
    setState(() => _isRunning = true);
    _signalService.reset();

    // Step 0: Generate identity keys
    setState(() => _currentStep = 0);
    await _signalService.initializeIdentities();
    await Future.delayed(const Duration(milliseconds: 600));

    // Step 1-5: Perform handshake
    setState(() => _currentStep = 1);
    await Future.delayed(const Duration(milliseconds: 400));
    setState(() => _currentStep = 2);

    await _signalService.performX3DHHandshake();

    // Animate through steps
    final steps = _signalService.stepRecords;
    for (var i = 0; i < steps.length && i < 4; i++) {
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() => _currentStep = 2 + i);
    }

    setState(() => _isRunning = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('X3DH Handshake'),
        actions: [
          IconButton(
            icon: const Icon(Icons.play_arrow),
            tooltip: 'Run Handshake',
            onPressed: _isRunning ? null : _runHandshake,
          ),
        ],
      ),
      body: Column(
        children: [
          _buildProgressIndicator(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: _buildStepContent(_currentStep),
              ),
            ),
          ),
          _buildControls(),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: List.generate(
          _steps.length,
          (index) => Expanded(
            child: Container(
              height: 4,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: index <= _currentStep
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey.shade800,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepContent(int step) {
    final records = _signalService.stepRecords;

    switch (step) {
      case 0:
        return _buildIdentityKeysCard(records);
      case 1:
        return _buildEphemeralKeyCard(records);
      case 2:
      case 3:
      case 4:
        return _buildDHCard(step - 2, records);
      case 5:
        return _buildHKDFCard(records);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildIdentityKeysCard(List<CryptoStepRecord> records) {
    final aliceRecord = records.where((r) => r.stepName == 'generate_alice_identity').firstOrNull;
    final bobRecord = records.where((r) => r.stepName == 'generate_bob_identity').firstOrNull;

    return _StepCard(
      step: 1,
      title: 'Generate Identity Keys',
      description: 'Alice and Bob each generate Ed25519 + X25519 key pairs',
      icon: Icons.fingerprint,
      color: Colors.teal,
      children: [
        if (aliceRecord != null)
          _buildKeyRow('Alice IK_A', _formatHex(aliceRecord.output), Colors.blue),
        if (bobRecord != null)
          _buildKeyRow('Bob IK_B', _formatHex(bobRecord.output), Colors.green),
        if (aliceRecord == null && bobRecord == null)
          const Center(child: Text('Tap ▶ to generate keys', style: TextStyle(color: Colors.grey))),
      ],
    );
  }

  Widget _buildEphemeralKeyCard(List<CryptoStepRecord> records) {
    final record = records.where((r) => r.stepName == 'x3dh_ephemeral').firstOrNull;
    return _StepCard(
      step: 2,
      title: 'Generate Ephemeral Key',
      description: 'Alice generates a new X25519 key pair for this session',
      icon: Icons.flash_on,
      color: Colors.amber,
      children: [
        if (record != null) ...[
          _buildKeyRow('EK_A (Public)', _formatHex(record.output), Colors.amber),
          const SizedBox(height: 8),
          Text(
            '⚠️ EK_A is used once and then discarded',
            style: TextStyle(fontSize: 12, color: Colors.orange.shade300),
          ),
        ] else
          const Center(child: Text('Waiting...', style: TextStyle(color: Colors.grey))),
      ],
    );
  }

  Widget _buildDHCard(int dhIndex, List<CryptoStepRecord> records) {
    final stepNames = ['x3dh_dh1', 'x3dh_dh2', 'x3dh_dh3'];
    final labels = [
      ('DH1', 'IK_A (private)', 'SPK_B (public)', Colors.teal),
      ('DH2', 'EK_A (private)', 'IK_B (public)', Colors.blue),
      ('DH3', 'EK_A (private)', 'SPK_B (public)', Colors.orange),
    ];
    final (label, privKey, pubKey, color) = labels[dhIndex];
    final record = records.where((r) => r.stepName == stepNames[dhIndex]).firstOrNull;

    return _StepCard(
      step: dhIndex + 3,
      title: 'Compute $label',
      description: 'X25519 scalar multiplication',
      icon: Icons.swap_horiz,
      color: color,
      children: [
        Row(
          children: [
            Expanded(child: _buildCryptoBox(privKey, color.withValues(alpha: 0.2))),
            const Icon(Icons.close, size: 16, color: Colors.grey),
            Expanded(child: _buildCryptoBox(pubKey, color.withValues(alpha: 0.2))),
          ],
        ),
        const SizedBox(height: 16),
        if (record != null) ...[
          Text('$label output (32 bytes):', style: TextStyle(fontSize: 11, color: Colors.grey.shade400)),
          const SizedBox(height: 6),
          _buildHexBlock(record.output, color),
        ] else
          const Text('Waiting...', style: TextStyle(color: Colors.grey)),
      ],
    ).animate().fadeIn(duration: 400.ms).slideX(begin: 0.1);
  }

  Widget _buildHKDFCard(List<CryptoStepRecord> records) {
    final record = records.where((r) => r.stepName == 'x3dh_hkdf').firstOrNull;

    return _StepCard(
      step: 6,
      title: 'HKDF Derive Shared Secret',
      description: 'SK = HKDF(0xFF×32 ‖ DH1 ‖ DH2 ‖ DH3)',
      icon: Icons.key,
      color: Colors.green,
      children: [
        _buildHKDFInputRow('Discontinuity', '0xFF × 32', Colors.red),
        _buildHKDFInputRow('DH1', '32 bytes', Colors.teal),
        _buildHKDFInputRow('DH2', '32 bytes', Colors.blue),
        _buildHKDFInputRow('DH3', '32 bytes', Colors.orange),
        const SizedBox(height: 12),
        const Divider(),
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(Icons.arrow_downward, color: Colors.green),
            const SizedBox(width: 8),
            Text('HKDF-SHA256 (RFC 5869 v3)',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade400)),
          ],
        ),
        const SizedBox(height: 16),
        if (record != null) ...[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.green.shade700, Colors.green.shade600]),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                const Text('Shared Secret (SK)', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Text(
                  _formatHex(record.output),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontFamily: 'monospace', fontSize: 12),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(12)),
                  child: const Row(mainAxisSize: MainAxisSize.min, children: [
                    Icon(Icons.check, color: Colors.white, size: 14),
                    SizedBox(width: 4),
                    Text('Alice SK == Bob SK', style: TextStyle(color: Colors.white, fontSize: 11)),
                  ]),
                ),
              ],
            ),
          ),
        ] else
          const Text('Waiting...', style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  String _formatHex(Uint8List? bytes) {
    if (bytes == null) return 'N/A';
    final hex = bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ');
    return hex.length > 95 ? '${hex.substring(0, 95)}...' : hex;
  }

  Widget _buildKeyRow(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(width: 4, height: 24, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontSize: 13)),
                Text(value, style: TextStyle(fontSize: 10, color: Colors.grey.shade400, fontFamily: 'monospace')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCryptoBox(String label, Color bgColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(8)),
      child: Text(label, style: const TextStyle(fontSize: 11, color: Colors.white70), textAlign: TextAlign.center),
    );
  }

  Widget _buildHexBlock(Uint8List? bytes, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        _formatHex(bytes),
        style: TextStyle(fontSize: 11, color: color, fontFamily: 'monospace'),
      ),
    );
  }

  Widget _buildHKDFInputRow(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(children: [
        Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
        const Spacer(),
        Text(value, style: TextStyle(fontSize: 11, color: Colors.grey.shade400, fontFamily: 'monospace')),
      ]),
    );
  }

  Widget _buildControls() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(top: BorderSide(color: Theme.of(context).dividerColor, width: 0.5)),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton.filled(
              onPressed: _currentStep > 0 && !_isRunning
                  ? () => setState(() => _currentStep--)
                  : null,
              icon: const Icon(Icons.arrow_back),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Text('Step ${_currentStep + 1} / ${_steps.length}',
                        style: TextStyle(fontSize: 11, color: Colors.grey.shade400)),
                    const SizedBox(height: 4),
                    Text(_steps[_currentStep],
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
            _currentStep < _steps.length - 1
                ? IconButton.filled(
                    onPressed: !_isRunning ? () => setState(() => _currentStep++) : null,
                    icon: const Icon(Icons.arrow_forward),
                  )
                : IconButton.filled(
                    onPressed: null,
                    icon: const Icon(Icons.check, color: Colors.green),
                    style: IconButton.styleFrom(backgroundColor: Colors.green.shade700),
                  ),
          ],
        ),
      ),
    );
  }
}

class _StepCard extends StatelessWidget {
  final int step;
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final List<Widget> children;

  const _StepCard({
    required this.step, required this.title, required this.description,
    required this.icon, required this.color, required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Container(
                width: 48, height: 48,
                decoration: BoxDecoration(color: color.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
                child: Icon(icon, color: color),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 2),
                    Text(description, style: TextStyle(fontSize: 12, color: Colors.grey.shade400)),
                  ],
                ),
              ),
            ]),
            const SizedBox(height: 24),
            ...children,
          ],
        ),
      ),
    );
  }
}
