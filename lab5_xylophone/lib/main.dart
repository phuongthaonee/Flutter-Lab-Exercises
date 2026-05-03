import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: XylophonePage(),
    );
  }
}

class XylophonePage extends StatelessWidget {
  XylophonePage({super.key});

  final AudioPlayer _player = AudioPlayer();

  // Helper function to build a xylophone key
  Expanded buildKey({required Color color, required int noteNumber}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 3,
            padding: EdgeInsets.zero,
          ),
          onPressed: () async {
            await _player.stop();
            await _player.play(AssetSource('note$noteNumber.wav'));
          },
          child: const SizedBox.expand(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4E0), // Beige/cream background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Colorful Musical Notes',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildKey(color: const Color(0xFFFF5252), noteNumber: 1), // Red
          buildKey(color: const Color(0xFFFF9800), noteNumber: 2), // Orange
          buildKey(color: const Color(0xFFFFEB3B), noteNumber: 3), // Yellow
          buildKey(color: const Color(0xFF66BB6A), noteNumber: 4), // Green
          buildKey(color: const Color(0xFF26A69A), noteNumber: 5), // Teal
          buildKey(color: const Color(0xFF42A5F5), noteNumber: 6), // Blue
          buildKey(color: const Color(0xFFAB47BC), noteNumber: 7), // Purple
        ],
      ),
    );
  }
}
