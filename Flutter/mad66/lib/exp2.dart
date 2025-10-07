// Exp2 - Live Text Display App
// Name: Divyam Navin
// Roll No.: 5023134
// Aim: To demonstrate state management using StatefulWidget.

import 'package:flutter/material.dart';

class Exp2 extends StatelessWidget {
  const Exp2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InstantDisplayScreen(),
    );
  }
}

class InstantDisplayScreen extends StatefulWidget {
  const InstantDisplayScreen({super.key});

  @override
  State<InstantDisplayScreen> createState() => _InstantDisplayScreenState();
}

class _InstantDisplayScreenState extends State<InstantDisplayScreen> {
  String _currentText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment 2 - Live Text Display'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Type something...',
              ),
              onChanged: (text) => setState(() => _currentText = text),
            ),
            const SizedBox(height: 20),
            Text(
              _currentText,
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
