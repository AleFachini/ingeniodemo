import 'package:flutter/material.dart';
import 'package:ingenio/core/service_locator.dart';
import 'package:ingenio/presentation/screens/pages/ingenio_page.dart';

void main() {
  setupLocator(); // Initialize the service locator
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ingenio Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: IngenioPage(title: 'Ingenio Demo Home Page'),
    );
  }
}
