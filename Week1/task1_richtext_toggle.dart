import 'package:flutter/material.dart';

class RichTextToggle extends StatefulWidget {
  const RichTextToggle({super.key});

  @override
  State<RichTextToggle> createState() => _RichTextToggleState();
}

class _RichTextToggleState extends State<RichTextToggle> {
  bool _showFullText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("RichText Toggle")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 16),
                children: [
                  const TextSpan(text: "Flutter makes it easy to build UIs. "),
                  if (_showFullText)
                    const TextSpan(
                        text:
                            "With widgets, layouts, and gestures, you
