import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'I Am Rich', home: const IAmRichPage());
  }
}

class IAmRichPage extends StatelessWidget {
  const IAmRichPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'I am Rich!',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[700],
      ),
      backgroundColor: Colors.grey[600],
      body: Center(child: Image.asset('assets/images/diamond.png')),
    );
  }
}
