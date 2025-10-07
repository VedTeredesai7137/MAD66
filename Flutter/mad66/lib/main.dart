import 'package:flutter/material.dart';
import 'exp2.dart';
import 'exp3.dart';
import 'exp4.dart';
import 'exp5.dart';
import 'exp6.dart';
import 'exp7.dart';
import 'exp8.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 🔥 Switch the current experiment here:
  final Widget currentExperiment = const Exp3(); // Exp1, Exp2, Exp4, Exp5

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: currentExperiment,
    );
  }
}
