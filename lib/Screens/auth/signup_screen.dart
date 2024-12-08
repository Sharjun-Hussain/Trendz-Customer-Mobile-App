import 'package:flutter/material.dart';
import 'package:trendz_customer/Components/Secondary_elevated_button.dart';
import 'package:trendz_customer/Components/elevated_button.dart';
import 'package:trendz_customer/Screens/auth/login_screen.dart';
import 'package:trendz_customer/Screens/auth/signup_screen.dart';
import 'package:trendz_customer/theming/app_colors.dart';
import 'package:trendz_customer/widgets/form_input.dart';
import 'package:trendz_customer/widgets/socialLogin.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipPath(
            clipper: BottomRoundedClipper(),
            child: Container(
              height: 150,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome To Trendz",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Register to Continue",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Register",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 35),
                const FormInput(
                  inputName: "Email",
                  placeHolder: "Enter Email",
                  icon: Icon(Icons.email_outlined),
                ),
                const SizedBox(height: 25),
                const FormInput(
                  inputName: "Password",
                  placeHolder: "Enter Password",
                  icon: Icon(Icons.lock_outline),
                ),
                const SizedBox(height: 25),
                const FormInput(
                  inputName: "Confirm Password",
                  placeHolder: "Enter Confirm Password",
                  icon: Icon(Icons.lock_outline),
                ),
                const SizedBox(height: 25),
                const FormInput(
                  inputName: "Full Name",
                  placeHolder: "Enter Full Name",
                  icon: Icon(Icons.lock_outline),
                ),
                const SizedBox(height: 25),
                const FormInput(
                  inputName: "Location",
                  placeHolder: "Enter Location",
                  icon: Icon(Icons.lock_outline),
                ),
                const SizedBox(height: 25),
                const FormInput(
                  inputName: "Password",
                  placeHolder: "Enter Password",
                  icon: Icon(Icons.lock_outline),
                ),
                const SizedBox(height: 25),
                const FormInput(
                  inputName: "Mobile No",
                  placeHolder: "Enter Enter Mobile Number",
                  icon: Icon(Icons.lock_outline),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => {},
                      child: const Text("Forgot Password?"),
                    )
                  ],
                ),
                const SizedBox(height: 25),
                CustomElevatedButton(
                  icon: Icons.cabin,
                  text: "Login",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                ),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Divider(
                        height: 1,
                        color: AppColors.gold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "or sign in with",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        height: 1,
                        color: AppColors.gold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 45); // Bottom-left edge
    path.quadraticBezierTo(
      size.width / 2, // Control point (x)
      size.height + 45, // Control point (y)
      size.width, // End point (x)
      size.height - 45, // End point (y)
    );
    path.lineTo(size.width, 0); // Top-right edge
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
