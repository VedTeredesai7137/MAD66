import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profile Card"),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings))],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
            ),
            const SizedBox(height: 16),
            const Text("Ved Teredesai",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("Thinker • Explorer • Creator",
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Column(children: [Text("100"), Text("Posts")]),
                Column(children: [Text("5k"), Text("Followers")]),
                Column(children: [Text("200"), Text("Following")]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
