import 'package:flutter/material.dart';
import 'screens/loading_screen.dart';

void main() {
  runApp(const ClimaApp());
}

class ClimaApp extends StatelessWidget {
  const ClimaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clima',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF0A3D62),
      ),
      home: const LoadingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
