import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'exp2.dart';
import 'exp3.dart';
import 'exp4.dart';
import 'exp5.dart';
import 'exp6.dart';
import 'exp7.dart';
import 'exp8.dart';
import 'exp9/exp9.dart';
import 'exp10/exp10.dart'; // ✅ New Import

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 🔥 Switch to Exp10 here
  final Widget currentExperiment = const Exp10();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practical 10: Testing & Deployment',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: currentExperiment,
    );
  }
}
