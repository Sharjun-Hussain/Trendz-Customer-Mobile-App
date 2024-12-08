import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:trendz_customer/Components/elevated_button.dart';
import 'package:trendz_customer/Pages/onboarding.dart';
import 'package:trendz_customer/Screens/App/Home_screen.dart';
import 'package:trendz_customer/theming/app_colors.dart';
import 'package:trendz_customer/widgets/form_input.dart';
import 'package:trendz_customer/widgets/socialLogin.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  String mobileNumber = ''; // To store the complete phone number

  String? _validateConfirmPassword(String value) {
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

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
                  Text("Register",
                      style: Theme.of(context).textTheme.headlineLarge),
                  const SizedBox(height: 35),
                  FormInput(
                    inputController: emailController,
                    inputType: "email",
                    inputName: "Email",
                    placeHolder: "Enter Email",
                  ),
                  const SizedBox(height: 25),
                  FormInput(
                    obscureText: true,
                    inputController: passwordController,
                    inputType: "password",
                    inputName: "Password",
                    placeHolder: "Enter Password",
                  ),
                  const SizedBox(height: 25),
                  FormInput(
                    inputController: confirmPasswordController,
                    obscureText: true,
                    inputType: "password",
                    inputName: "Confirm Password",
                    placeHolder: "Re-enter Password",
                  ),
                  const SizedBox(height: 25),
                  FormInput(
                    inputController: fullNameController,
                    inputType: "text",
                    inputName: "Full Name",
                    placeHolder: "Enter Full Name",
                  ),
                  const SizedBox(height: 25),
                  FormInput(
                    inputController: locationController,
                    inputType: "text",
                    inputName: "Location",
                    placeHolder: "Enter Location",
                  ),
                  const SizedBox(height: 25),
                  IntlPhoneField(
                    style: Theme.of(context).textTheme.bodySmall,
                    decoration: InputDecoration(
                      labelStyle: Theme.of(context).textTheme.bodySmall,
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 2.0,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
                    ),
                    initialCountryCode: 'LK',
                    onChanged: (phone) {
                      setState(() {
                        mobileNumber = phone.completeNumber;
                      });
                    },
                  ),
                  const SizedBox(height: 25),
                  CustomElevatedButton(
                    icon: Icons.cabin,
                    text: "Register",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Divider(height: 1, color: AppColors.gold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "or sign in with",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      const Expanded(
                        child: Divider(height: 1, color: AppColors.gold),
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
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Onboarding(),
                      ),
                    )
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.gold,
                    ),
                  ),
                ),
                const SizedBox(height: 45),
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
    path.lineTo(0, size.height - 45);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 45,
      size.width,
      size.height - 45,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
