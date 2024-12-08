import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Trendz Hair Studio"),
            Text("YOur Saloon Partner"),
            Image.asset(
              "lib/assets/images/logo.png",
              width: 65,
              height: 65,
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
