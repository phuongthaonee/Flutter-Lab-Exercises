import 'package:flutter/material.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final int total;
  final VoidCallback onRestart;

  const ScorePage({
    super.key,
    required this.score,
    required this.total,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Quiz Finished!',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Score: $score / $total',
              style: const TextStyle(fontSize: 30, color: Colors.yellow),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                onRestart();
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Text('Restart', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
