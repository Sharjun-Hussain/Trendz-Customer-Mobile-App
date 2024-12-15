import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:trendz_customer/Components/elevated_button.dart';
import 'package:trendz_customer/Pages/onboarding.dart';
import 'package:trendz_customer/Screens/auth/otpVerification.dart';
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
          tooltip: "Go Back",
        ),
        title: Text(
          "Welcome To Trendz",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: BottomRoundedClipper(),
              child: Container(
                height: 100,
                width: double.infinity,
                color: Theme.of(context).primaryColor,
                child: Center(
                  child: Text(
                    "Register to continue",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
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
                    inputController: fullNameController,
                    inputType: "text",
                    inputName: "Full Name",
                    placeHolder: "Enter Full Name",
                  ),
                  const SizedBox(height: 25),
                  FormInput(
                    inputController: emailController,
                    inputType: "email",
                    inputName: "Email ID",
                    placeHolder: "Enter Email ",
                  ),
                  const SizedBox(height: 25),
                  FormInput(
                    inputController: locationController,
                    inputType: "text",
                    inputName: "Residence City",
                    placeHolder: "Enter Residence City",
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
                  IntlPhoneField(
                    style: Theme.of(context).textTheme.bodySmall,
                    decoration: InputDecoration(
                      labelStyle: Theme.of(context).textTheme.bodySmall,
                      labelText: 'Mobile Number',
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
                    icon: Iconsax.login_1,
                    text: "Register",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpVerification(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 25),
                  Center(
                    child: Text("or"),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Divider(height: 1, color: AppColors.gold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Register with",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      const Expanded(
                        child: Divider(height: 1, color: AppColors.gold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Sociallogin(
                          handleSocialLogin: () => {},
                          name: "Google",
                          socialImagePath: "lib/assets/images/google.png",
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Sociallogin(
                          handleSocialLogin: () => {},
                          name: "Facebook",
                          socialImagePath: "lib/assets/images/facebook.png",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Onboarding(),
                      ),
                    )
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
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
