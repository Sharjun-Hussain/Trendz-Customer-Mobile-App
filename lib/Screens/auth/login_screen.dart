import 'package:flutter/material.dart';
import 'package:trendz_customer/Components/elevated_button.dart';
import 'package:trendz_customer/Pages/onboarding.dart';
import 'package:trendz_customer/Screens/App/Home_screen.dart';
import 'package:trendz_customer/Screens/auth/signup_screen.dart';
import 'package:trendz_customer/theming/app_colors.dart';
import 'package:trendz_customer/widgets/form_input.dart';
import 'package:trendz_customer/widgets/socialLogin.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.gold,
                    borderRadius: BorderRadius.circular(12)),
                width: double.infinity,
                height: 220,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 25,
                        ),
                        IconButton(
                          onPressed: () => {Navigator.pop(context)},
                          icon: const Icon(Icons.arrow_back_ios),
                        )
                      ],
                    ),
                    Center(
                      child: Text(
                        "Image",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  children: [
                    Text("Login",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Hi! Welcome Back You're been missed",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ],
                ),
              ),
              Column(
                children: [
                  // Email field ----------------------------------------

                  const SizedBox(
                    height: 50,
                  ),
                  const FormInput(
                    inputName: "Email Address",
                    placeHolder: "Enter your Email Address",
                    icon: Icon(Icons.alternate_email),
                  ),
                  //password field ------------------------------------

                  const FormInput(
                    inputName: "Password",
                    placeHolder: "**************",
                    icon: Icon(Icons.lock_outline),
                  ),

                  // forgot password ----------------------------

                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => {},
                          child: const Text("Forgot Password?"),
                        )
                      ],
                    ),
                  ),

                  //login -------------------------------------------

                  const SizedBox(
                    height: 25,
                  ),
                  CustomElevatedButton(
                      text: "Login",
                      icon: Icons.login,
                      onPressed: () => {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()))
                          }),
                  //Sign in using google ------------------------

                  const SizedBox(
                    height: 45,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
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
                  ),

                  // Sign in WIth Icons -----------------------------------

                  const SizedBox(
                    height: 30,
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

                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupScreen()))
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Theme.of(context).hintColor),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
