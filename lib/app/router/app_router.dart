import 'package:go_router/go_router.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/chat/presentation/pages/chat_page.dart';
import '../../features/chat/presentation/pages/chat_setup_page.dart';
import '../../features/visualization/presentation/pages/x3dh_visualization_page.dart';
import '../../features/visualization/presentation/pages/ratchet_visualization_page.dart';
import '../../features/visualization/presentation/pages/crypto_pipeline_page.dart';
import '../../features/key_management/presentation/pages/identity_key_page.dart';
import '../../features/key_management/presentation/pages/prekey_management_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const DashboardPage(),
    ),
    GoRoute(
      path: '/chat',
      builder: (context, state) => const ChatPage(),
    ),
    GoRoute(
      path: '/chat/setup',
      builder: (context, state) => const ChatSetupPage(),
    ),
    GoRoute(
      path: '/visualization/x3dh',
      builder: (context, state) => const X3DHVisualizationPage(),
    ),
    GoRoute(
      path: '/visualization/ratchet',
      builder: (context, state) => const RatchetVisualizationPage(),
    ),
    GoRoute(
      path: '/visualization/pipeline',
      builder: (context, state) => const CryptoPipelinePage(),
    ),
    GoRoute(
      path: '/keys/identity',
      builder: (context, state) => const IdentityKeyPage(),
    ),
    GoRoute(
      path: '/keys/prekeys',
      builder: (context, state) => const PreKeyManagementPage(),
    ),
  ],
);
