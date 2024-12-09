import 'package:flutter/material.dart';
import 'package:trendz_customer/Pages/onboarding.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    // Set a delay of 3 seconds before navigating to the next screen
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to the Onboarding screen after the splash screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Onboarding()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor, // Set background color
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            // Title text
            Text("Trendz Hair Studio",
                style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 10),
            // Subtitle text
            const Text(
              "Your Saloon Partner",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70, // Adjusted color for subtitle contrast
              ),
            ),
            const SizedBox(height: 230),
            // Logo centered below the text
            Center(
              child: Image.asset(
                "lib/assets/images/logo.png",
                width: 200, // Adjust the width as needed
                height: 200, // Adjust the height as needed
              ),
            ),
            const Spacer(), // Spacer to push the text at the bottom
            // Footer section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "Powered by : SoftExpertz (PVT) Ltd",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white, // Adjusted color for footer contrast
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Version: 1.0.0",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white, // Adjusted color for footer contrast
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
