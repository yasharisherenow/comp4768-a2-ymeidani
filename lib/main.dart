import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'routing/router.dart';

void main() {
  usePathUrlStrategy();
  runApp(
    ProviderScope(
      retry: (retryCount, error) => null,
      child: const AdoptFosterApp(),
    ),
  );
}   
class AdoptFosterApp extends StatelessWidget {
  const AdoptFosterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Adopt & Foster',
      routerConfig: router,
    );
  }
}