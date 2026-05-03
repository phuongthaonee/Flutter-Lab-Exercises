import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MagicBallPage());
  }
}

class MagicBallPage extends StatefulWidget {
  const MagicBallPage({super.key});

  @override
  State<MagicBallPage> createState() => _MagicBallPageState();
}

class _MagicBallPageState extends State<MagicBallPage> {
  int ballNumber = 1;

  void changeBall() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
        title: const Text('Ask Me Anything'),
        backgroundColor: const Color.fromARGB(255, 176, 166, 239),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          onPressed: changeBall,
          child: Image.asset('assets/images/ball$ballNumber.png'),
        ),
      ),
    );
  }
}
