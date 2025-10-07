// Exp8 - JSON Demo
// Name: Divyam Navin
// Roll No.: 5023134
// Practical - 8
// Aim: Load JSON from assets and display data.

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Exp8 extends StatefulWidget {
  const Exp8({super.key});

  @override
  State<Exp8> createState() => _Exp8State();
}

class _Exp8State extends State<Exp8> {
  String output = "Loading...";

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  Future<void> loadJson() async {
    try {
      final String response = await rootBundle.loadString('assets/data.json');
      final data = json.decode(response);
      setState(() {
        output =
            "Name: ${data['name']}, Age: ${data['age']}, Skills: ${data['skills']}";
      });
    } catch (e) {
      setState(() {
        output = "Error loading JSON: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Experiment 8 - JSON Demo")),
        body: Center(child: Text(output)),
      ),
    );
  }
}
