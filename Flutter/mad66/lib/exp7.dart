// Exp7 - Navigation & Gestures
// Name: Divyam Navin
// Roll No.: 5023134
// Practical - 7
// Aim: Demonstrate navigation and gesture detection in Flutter.

import 'package:flutter/material.dart';

class Exp7 extends StatelessWidget {
  const Exp7({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Navigation & Gestures Demo",
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/second': (context) => const SecondPage(),
      },
    );
  }
}

// Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Navigation Button
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/second'),
              child: const Text("Go to Second Page"),
            ),
            const SizedBox(height: 20),

            // Gesture Example
            GestureDetector(
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Container Tapped!"))),
              onDoubleTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Double Tapped!"))),
              onLongPress: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Long Pressed!"))),
              child: Container(
                width: 150,
                height: 100,
                color: Colors.blueAccent,
                alignment: Alignment.center,
                child: const Text(
                  "Tap / Double Tap / Long Press",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Second Page
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Go Back"),
        ),
      ),
    );
  }
}
