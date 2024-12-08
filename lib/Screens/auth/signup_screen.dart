import 'package:flutter/material.dart';
import 'package:trendz_customer/Components/elevated_button.dart';
import 'package:trendz_customer/Pages/onboarding.dart';
import 'package:trendz_customer/theming/app_colors.dart';
import 'package:trendz_customer/widgets/form_input.dart';
import 'package:trendz_customer/widgets/socialLogin.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController fullnamecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                  FormInput(
                    inputController: emailcontroller,
                    inputType: "email",
                    inputName: "Email",
                    placeHolder: "Enter Email",
                  ),
                  const SizedBox(height: 25),
                  FormInput(
                    obscureText: true,
                    inputController: passwordcontroller,
                    inputType: "password",
                    inputName: "Password",
                    placeHolder: "Enter Password",
                  ),
                  const SizedBox(height: 25),
                  FormInput(
                    inputController: confirmpasswordcontroller,
                    obscureText: true,
                    inputType: "password",
                    inputName: "Confirm Password",
                    placeHolder: "Enter Confirm Password",
                  ),
                  const SizedBox(height: 25),
                  FormInput(
                    inputController: fullnamecontroller,
                    inputType: "text",
                    inputName: "Full Name",
                    placeHolder: "Enter Full Name",
                  ),
                  const SizedBox(height: 25),
                  FormInput(
                    inputController: locationcontroller,
                    inputType: "text",
                    inputName: "Location",
                    placeHolder: "Enter Location",
                  ),
                  const SizedBox(height: 25),
                  FormInput(
                    inputController: mobilecontroller,
                    inputType: "phone",
                    inputName: "Mobile No",
                    placeHolder: "Enter Enter Mobile Number",
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
                        MaterialPageRoute(
                            builder: (context) => const Onboarding()),
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Onboarding()))
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.gold),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
              ],
            )
          ],
        ),
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
