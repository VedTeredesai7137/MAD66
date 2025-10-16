import 'package:flutter/material.dart';

class Exp10 extends StatelessWidget {
  const Exp10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Practical 10: Flutter App Testing & Deployment",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Aim:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "To test and deploy a production ready Flutter app on Android platform.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              "Theory Steps:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            _buildStep(
              step: "1. Testing and Final Code Review",
              desc: "• Run the app on a real Android device to detect issues.\n"
                  "• Use `flutter analyze` to check and fix any problems.\n"
                  "• Ensure code and UI are stable before building the release version.",
            ),
            _buildStep(
              step: "2. Add App Icon and Update Name",
              desc: "• Replace the default Flutter icon using Android Asset Studio.\n"
                  "• Update `AndroidManifest.xml` to change the app name with android:label.",
            ),
            _buildStep(
              step: "3. Create a Signing Key",
              desc: "• Run keytool to generate a keystore (.jks).\n"
                  "• Create `key.properties` file to store keystore credentials.\n"
                  "• Add key paths to `.gitignore` for security.",
            ),
            _buildStep(
              step: "4. Configure Gradle for Signing",
              desc: "• Edit `android/app/build.gradle` to load keystore properties.\n"
                  "• Add `signingConfigs` and `release` configuration for Gradle.",
            ),
            _buildStep(
              step: "5. Build the Release App",
              desc: "• Run `flutter build appbundle --release` for Play Store (.aab).\n"
                  "• Run `flutter build apk --release` to generate .apk.\n"
                  "• Locate output in `build/app/outputs/`.",
            ),
            const SizedBox(height: 16),
            const Text(
              "Conclusion:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "This experiment covered testing, icon & name customization, keystore creation, "
              "Gradle signing configuration, and generating both .apk and .aab files. "
              "The app is now ready for production deployment.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.play_arrow),
                label: const Text(
                  "Run flutter analyze",
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                onPressed: () {
                  _showDialog(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildStep({required String step, required String desc}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            step,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            desc,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  static void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Command Info"),
        content: const Text(
          "You can run this command in the terminal:\n\nflutter analyze\n\n"
          "This will check your code for errors and warnings before release.",
        ),
        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
        ],
      ),
    );
  }
}
