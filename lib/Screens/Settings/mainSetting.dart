import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendz_customer/widgets/main_navigation.dart';

class Mainsetting extends StatelessWidget {
  const Mainsetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            CustomNavigation(
                navigationtitle: "Theme Settings",
                navigationIcon: Icon(Iconsax.sun_fog),
                navigate: () => {}),
            CustomNavigation(
                navigationtitle: "Notification Settings",
                navigationIcon: Icon(Iconsax.notification),
                navigate: () => {}),
            CustomNavigation(
                navigationtitle: "Security",
                navigationIcon: Icon(Iconsax.shield),
                navigate: () => {}),
            CustomNavigation(
                navigationtitle: "Clear Cache",
                navigationIcon: Icon(Iconsax.trash),
                navigate: () => {}),
            CustomNavigation(
                navigationtitle: "Rate TrendZ Hair Studio",
                navigationIcon: Icon(Iconsax.route_square),
                navigate: () => {}),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    height: 1,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            CustomNavigation(
                navigationtitle: "Share App",
                navigationIcon: Icon(Iconsax.share),
                navigate: () => {}),
          ],
        ),
      ),
    );
  }
}
