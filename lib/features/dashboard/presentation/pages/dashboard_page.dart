import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/di/injection.dart';
import '../../../../data/server/iserver_provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isServerHealthy = false;
  bool _isCheckingHealth = true;

  @override
  void initState() {
    super.initState();
    _checkServerHealth();
  }

  Future<void> _checkServerHealth() async {
    setState(() => _isCheckingHealth = true);
    try {
      final server = getIt<IServerProvider>();
      final healthy = await server.healthCheck();
      setState(() {
        _isServerHealthy = healthy;
        _isCheckingHealth = false;
      });
    } catch (e) {
      setState(() {
        _isServerHealthy = false;
        _isCheckingHealth = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signal Protocol Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _checkServerHealth,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            const SizedBox(height: 32),
            _buildStatusCard(),
            const SizedBox(height: 32),
            _buildNavigationGrid(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Icon(
          Icons.lock,
          size: 64,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(height: 16),
        Text(
          'Signal Protocol Demo',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'End-to-End Encryption Visualization',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey,
              ),
        ),
      ],
    );
  }

  Widget _buildStatusCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Text(
                  'System Status',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildStatusRow(
              'Server',
              _isCheckingHealth
                  ? 'Checking...'
                  : (_isServerHealthy ? 'Healthy' : 'Unavailable'),
              _isCheckingHealth
                  ? Colors.orange
                  : (_isServerHealthy ? Colors.green : Colors.red),
            ),
            const SizedBox(height: 8),
            _buildStatusRow(
              'Session',
              'Not Initialized',
              Colors.grey,
            ),
            const SizedBox(height: 8),
            _buildStatusRow(
              'Dependencies',
              'Ready',
              Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusRow(String label, String value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(value, style: TextStyle(color: color)),
          ],
        ),
      ],
    );
  }

  Widget _buildNavigationGrid(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Features',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.2,
          children: [
            _buildNavigationCard(
              context,
              'Chat',
              Icons.chat_bubble_outline,
              '/chat',
              Colors.blue,
            ),
            _buildNavigationCard(
              context,
              'X3DH',
              Icons.key,
              '/visualization/x3dh',
              Colors.purple,
            ),
            _buildNavigationCard(
              context,
              'Ratchet',
              Icons.sync_alt,
              '/visualization/ratchet',
              Colors.green,
            ),
            _buildNavigationCard(
              context,
              'Pipeline',
              Icons.account_tree,
              '/visualization/pipeline',
              Colors.orange,
            ),
            _buildNavigationCard(
              context,
              'Identity Keys',
              Icons.fingerprint,
              '/keys/identity',
              Colors.teal,
            ),
            _buildNavigationCard(
              context,
              'PreKeys',
              Icons.vpn_key,
              '/keys/prekeys',
              Colors.indigo,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNavigationCard(
    BuildContext context,
    String title,
    IconData icon,
    String route,
    Color color,
  ) {
    return Card(
      child: InkWell(
        onTap: () => context.go(route),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
