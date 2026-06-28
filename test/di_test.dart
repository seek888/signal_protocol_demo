import 'package:flutter_test/flutter_test.dart';
import 'package:signal_protocol_demo/app/di/injection.dart';
import 'package:signal_protocol_demo/data/server/iserver_provider.dart';

void main() {
  setUpAll(() {
    configureDependencies();
  });

  tearDownAll(() {
    getIt.reset();
  });

  test('DI configuration should register IServerProvider', () {
    final server = getIt<IServerProvider>();
    expect(server, isNotNull);
  });

  test('MockServerProvider should pass health check', () async {
    final server = getIt<IServerProvider>();
    final isHealthy = await server.healthCheck();

    expect(isHealthy, isTrue);
  });
}
