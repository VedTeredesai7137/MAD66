// Exp6 - Icons, Images & Bar Chart
// Name: Divyam Navin
// Roll No.: 5023134
// Practical - 6
// Aim: Demonstrate use of Icons, Images, and a manual Bar Chart.

import 'package:flutter/material.dart';

class Exp6 extends StatelessWidget {
  const Exp6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Better Manual Bar Chart",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Icons, Images & Bar Chart"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Icon Example
              const Icon(Icons.star, color: Colors.orange, size: 50),
              const SizedBox(height: 20),

              // Image Example
              Image.network(
                "https://flutter.dev/assets/homepage/carousel/slide_1-bg-4c6fcef17b7b52c57d205c3bd6c3a1e9a0f7a31c2a8b3bf3f1e6c2d84cb799b3.jpg",
                height: 150,
              ),
              const SizedBox(height: 20),

              // Bar Chart Title
              const Text(
                "Improved Bar Chart",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Manual Bar Chart
              SizedBox(
                height: 150,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Bar 1
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(height: 50, color: Colors.blue),
                          const SizedBox(height: 5),
                          const Text("3"),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Bar 2
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(height: 80, color: Colors.green),
                          const SizedBox(height: 5),
                          const Text("5"),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Bar 3
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(height: 30, color: Colors.orange),
                          const SizedBox(height: 5),
                          const Text("2"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
