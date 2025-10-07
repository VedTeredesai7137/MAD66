// Exp1 - Flutter UI Design using Common Widgets
// Name: Divyam Navin
// Roll No.: 5023134
// Practical - 3
// Aim: To design Flutter UI by including common widgets.

import 'package:flutter/material.dart';

class Exp1 extends StatelessWidget {
  const Exp1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AllTasksScreen(),
    );
  }
}

class AllTasksScreen extends StatelessWidget {
  const AllTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Experiment 1 - Common Widgets"),
          backgroundColor: Colors.deepPurple,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              ProfileCard(),
              Divider(height: 40, thickness: 1),
              RatingWidget(),
              Divider(height: 40, thickness: 1),
              ContentToggle(),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Sub-Task 1.1: Social Media Profile Card ---
class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 53,
          backgroundColor: Colors.grey.shade300,
          child: const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "Ved Teredesai",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          "Flutter Developer | Tech Enthusiast",
          style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatColumn("Posts", "120"),
            _buildStatColumn("Followers", "1.2M"),
            _buildStatColumn("Following", "350"),
          ],
        ),
      ],
    );
  }

  static Column _buildStatColumn(String label, String count) {
    return Column(
      children: [
        Text(count,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

// --- Sub-Task 1.2: Rating Widget ---
class RatingWidget extends StatefulWidget {
  const RatingWidget({super.key});

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Rate this App", style: TextStyle(fontSize: 18)),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return IconButton(
              icon: Icon(
                index < _rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
              ),
              onPressed: () => setState(() => _rating = index + 1),
            );
          }),
        ),
        Text("Your Rating: $_rating", style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}

// --- Sub-Task 1.3: Content Toggle ---
class ContentToggle extends StatefulWidget {
  const ContentToggle({super.key});

  @override
  State<ContentToggle> createState() => _ContentToggleState();
}

class _ContentToggleState extends State<ContentToggle> {
  bool _showFullText = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style:
                const TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
            children: [
              const TextSpan(
                  text:
                      "Flutter is an open-source UI SDK created by Google. It is used to develop cross-platform applications"),
              if (_showFullText)
                const TextSpan(
                  text:
                      " from a single codebase for web, Android, iOS, macOS, Linux, and Windows — allowing developers to write once and deploy anywhere.",
                  style: TextStyle(color: Colors.black54),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextButton(
          child: Text(_showFullText ? "Read Less" : "Read More"),
          onPressed: () => setState(() => _showFullText = !_showFullText),
        ),
      ],
    );
  }
}
