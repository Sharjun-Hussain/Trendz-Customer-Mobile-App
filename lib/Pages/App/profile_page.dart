import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendz_customer/Components/elevated_button.dart';
import 'package:trendz_customer/Pages/onboarding.dart';
import 'package:trendz_customer/Screens/Profile/Profile_page.dart';
import 'package:trendz_customer/Screens/Settings/mainSetting.dart';
import 'package:trendz_customer/widgets/main_navigation.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          // logic
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Profile",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      height: 90,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  AssetImage("lib/assets/images/profile.png"),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mohamed Hussain Sharjun",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                "SharjunHussain@outlook.com",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomNavigation(
                      navigate: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PersonalPage()));
                        // Navigate to a specific profile detail page
                      },
                      navigationtitle: "Your Profile",
                      navigationIcon: Icon(
                        Iconsax.personalcard,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    CustomNavigation(
                      navigate: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Mainsetting()));
                        // Navigate to a settings page
                      },
                      navigationtitle: "Settings",
                      navigationIcon: Icon(
                        Iconsax.setting,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    CustomNavigation(
                      navigate: () {
                        // Navigate to a privacy policy page
                      },
                      navigationtitle: "Privacy Policy",
                      navigationIcon: Icon(
                        Iconsax.setting_4,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "App Version: 1.0.0",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                    const SizedBox(height: 10),
                    CustomElevatedButton(
                      text: "Logout",
                      icon: Iconsax.logout4,
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Onboarding(),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
