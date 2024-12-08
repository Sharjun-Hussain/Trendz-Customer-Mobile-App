import 'package:flutter/material.dart';
import 'package:trendz_customer/Components/Secondary_elevated_button.dart';
import 'package:trendz_customer/Components/elevated_button.dart';
import 'package:trendz_customer/Screens/auth/login_screen.dart';
import 'package:trendz_customer/Screens/auth/signup_screen.dart';
import 'package:trendz_customer/theming/app_colors.dart';
import 'package:trendz_customer/widgets/socialLogin.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 0,
          ),
          Text(
            "Welcome to TrendZ",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 5),
            child: Text(
              "Step in for a personalized salon experience that leaves you glowing.",
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          Container(
            width: 200,
            height: 200,
            child: Image.asset("lib/assets/images/logo.png"),
          ),
          const SizedBox(
            height: 40,
          ),
          CustomElevatedButton(
              text: "Login",
              icon: Icons.login,
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()))
                  }),
          const SizedBox(
            height: 15,
          ),
          SecondaryElevatedButton(
            text: "SIgn up",
            icon: Icons.crisis_alert_sharp,
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignupScreen()))
            },
            backgroundColor: Theme.of(context).cardColor,
            borderColor: Theme.of(context).hintColor,
            textColor: Theme.of(context).hintColor,
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Expanded(
                child: Divider(
                  height: 1,
                  color: AppColors.gold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Getting Start with",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const Expanded(
                child: Divider(
                  height: 1,
                  color: AppColors.gold,
                ),
              )
            ]),
          ),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Sociallogin(
                    name: "Google",
                    socialImagePath: "lib/assets/images/google.png",
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Sociallogin(
                    name: "Facebook",
                    socialImagePath: "lib/assets/images/facebook.png",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
