import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/app.dart';
import 'app/di/injection.dart';

void main() {
  configureDependencies();
  runApp(const ProviderScope(child: SignalProtocolDemoApp()));
}
