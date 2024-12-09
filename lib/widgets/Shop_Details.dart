import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:android_intent_plus/android_intent.dart';

class ShopDetails extends StatelessWidget {
  const ShopDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (builder) {
            return Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24)),
                color: Theme.of(context).cardColor,
              ),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        "Trendz Hair Studio",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        "TrendzHairStudio@gmail.com",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        "Contact : 077 98 98 445",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      ElevatedButton.icon(
                        onPressed: () async {
                          final AndroidIntent intent = const AndroidIntent(
                            action: 'action_application_details_settings',
                            data:
                                'package:com.google.android.apps.maps', // Replace appropriately
                          );
                          await intent.launch();
                        },
                        icon: const Icon(Iconsax.location),
                        label: const Text("Find Location"),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 70,
              child: Image.asset("lib/assets/images/logo.png"),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Trendz Saloon",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontSize: 20),
                      ),
                      Text(
                        "153B, Akbar Road,",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        "Maruthamunai, Sri Lanka",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const Icon(Icons.location_on_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
