import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:trendz_customer/Components/elevated_button.dart';
import 'package:trendz_customer/Models/customer_location_modal.dart';
import 'package:trendz_customer/Pages/onboarding.dart';
import 'package:trendz_customer/Screens/auth/otpVerification.dart';
import 'package:trendz_customer/Services/api_services.dart';
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
  List<CustomerLocationModal>? locationlist = [];
  String mobileNumber = ''; // To store the complete phone number
  String selectedLocation = "Maruthamunai";
  int selectedLocationid = 1;
  String? selectedGender;

  bool isUpperCase = false;
  bool isLowerCase = false;
  bool isNumber = false;
  bool isSpecialChar = false;
  bool isMinLength = false;

  String? _validateConfirmPassword(String value) {
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  Widget _passwordRequirement(String text, bool isValid) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle : Icons.cancel,
          color: isValid ? Colors.green : Colors.red,
        ),
        const SizedBox(width: 8),
        Text(text,
            style: TextStyle(
              color: isValid ? Colors.green : Colors.red,
            )),
      ],
    );
  }

  void _handleRegister() async {
    var result = await ApiService().RegisterWithEmailPassword(
      emailController.text,
      selectedLocationid,
      fullNameController.text,
      mobileNumber,
      selectedGender!,
      passwordController.text,
    );

    print(result);

    if (result["success"] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Registration Succesfull",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          backgroundColor: const Color.fromARGB(255, 71, 218, 76),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Onboarding()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result["message"]),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> fetchLocation() async {
    try {
      final response = await ApiService().fetchlocation();
      setState(() {
        locationlist = response.data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchLocation();
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
                  Text("Gender", style: Theme.of(context).textTheme.bodyMedium),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                              activeColor: Theme.of(context).primaryColor,
                              value: 'Male',
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value.toString();
                                });
                              },
                            ),
                            const Text('Male'),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                              activeColor: Theme.of(context).primaryColor,
                              value: 'Female',
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value.toString();
                                });
                              },
                            ),
                            const Text('Female'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  DropdownButtonFormField<String>(
                    style: Theme.of(context).textTheme.bodyMedium,
                    value: selectedLocation,
                    decoration: InputDecoration(
                        isDense: true,
                        labelText: "Residence City",
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ))),
                    items: locationlist?.map((location) {
                          return DropdownMenuItem<String>(
                            value: location.name,
                            child: Text(location.name ?? "Unknown"),
                          );
                        }).toList() ??
                        [], // Handle null list by providing an empty list
                    onChanged: (value) {
                      setState(() {
                        selectedLocationid = locationlist!
                            .firstWhere((element) => element.name == value)
                            .id!;
                        selectedLocation = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 25),
                  FormInput(
                    inputName: 'Password',
                    placeHolder: 'Create a password',
                    inputController: passwordController,
                    inputType: 'password',
                    obscureText: true,
                    showPasswordRequirements:
                        true, // Show password rules for registration
                  ),
                  const SizedBox(height: 25),
                  FormInput(
                    inputController: confirmPasswordController,
                    obscureText: true,
                    inputType: "confirmPassword",
                    inputName: "Confirm Password",
                    placeHolder: "Re-enter Password",
                    originalPassword: passwordController.text,
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
                      onPressed: _handleRegister),
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
                  const SizedBox(height: 25),
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
