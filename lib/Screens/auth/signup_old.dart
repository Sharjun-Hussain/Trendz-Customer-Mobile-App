import 'package:flutter/material.dart';
import 'package:trendz_customer/Components/elevated_button.dart';
import 'package:trendz_customer/Screens/App/Home_screen.dart';
import 'package:trendz_customer/Screens/auth/login_screen.dart';
import 'package:trendz_customer/Screens/auth/signup_screen.dart';
import 'package:trendz_customer/theming/app_colors.dart';
import 'package:trendz_customer/widgets/form_input.dart';
import 'package:trendz_customer/widgets/socialLogin.dart';

class SignupScreenold extends StatelessWidget {
  const SignupScreenold({super.key});

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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Icon(
                          Icons.arrow_back_ios,
                          size: 24,
                          color: AppColors.black,
                        ),
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
                    Text("Register",
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
              const SizedBox(
                height: 20,
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
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        height: 1,
                        color: AppColors.gold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Get Started with"),
                    ),
                    Expanded(
                      child: Divider(
                        height: 1,
                        color: AppColors.gold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  // Email field ----------------------------------------

                  const SizedBox(
                    height: 10,
                  ),
                  const FormInput(
                    inputName: "Email Address",
                    placeHolder: "Enter your Email Address",
                    icon: Icon(Icons.alternate_email),
                  ),

                  const FormInput(
                    inputName: "Full Name",
                    placeHolder: "Sharjun Hussain",
                    icon: Icon(Icons.person_2_outlined),
                  ),
                  const FormInput(
                    inputName: "Age",
                    placeHolder: "Enter your Age",
                    icon: Icon(Icons.view_agenda_outlined),
                  ),
                  const FormInput(
                    inputName: "City",
                    placeHolder: "Sainthamaruthu",
                    icon: Icon(Icons.location_on),
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

                  //login -------------------------------------------

                  const SizedBox(
                    height: 25,
                  ),
                  CustomElevatedButton(
                      text: "Register", icon: Icons.login, onPressed: () => {}),
                  //Sign in using google ------------------------

                  const SizedBox(
                    height: 5,
                  ),

                  // Sign in WIth Icons -----------------------------------

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
                                  builder: (context) => const Login()))
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
