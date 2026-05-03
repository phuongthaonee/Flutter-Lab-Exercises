import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: const MiCard());
  }
}

class MiCard extends StatelessWidget {
  const MiCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
            ),
            const SizedBox(height: 15),
            const Text(
              'Nguyễn Phương Thảo',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'UNIVERSITY STUDENT',
              style: TextStyle(
                fontSize: 18,
                color: Colors.teal[100],
                letterSpacing: 2.5,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 20,
              width: 150,
              child: Divider(color: Colors.white, thickness: 1),
            ),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: const Icon(Icons.phone, color: Colors.teal),
                title: Text(
                  '+84 814 346 903',
                  style: TextStyle(color: Colors.teal[900], fontSize: 16),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: const Icon(Icons.email, color: Colors.teal),
                title: Text(
                  'thaonp.23ite@vku.udn.vn',
                  style: TextStyle(color: Colors.teal[900], fontSize: 16),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: const Icon(Icons.school, color: Colors.teal),
                title: Text(
                  'Vietnam-Korea University',
                  style: TextStyle(color: Colors.teal[900], fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
