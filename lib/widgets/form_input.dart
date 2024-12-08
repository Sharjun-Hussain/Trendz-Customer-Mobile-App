import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final String inputName;
  final String placeHolder;
  final String inputType;
  final TextEditingController inputController;
  final bool obscureText; // Optional with default value

  const FormInput({
    super.key,
    required this.inputName,
    required this.placeHolder,
    required this.inputController,
    required this.inputType,
    this.obscureText = false, // Default value is false
  });

  @override
  Widget build(BuildContext context) {
    // Determine keyboard type based on inputType
    TextInputType getKeyboardType(String inputType) {
      switch (inputType.toLowerCase()) {
        case 'email':
          return TextInputType.emailAddress;
        case 'number':
          return TextInputType.number;
        case 'phone':
          return TextInputType.phone;
        default:
          return TextInputType.text;
      }
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            obscureText: obscureText, // Set obscureText dynamically
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: getKeyboardType(inputType),
            controller: inputController,
            autofocus: true,
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              labelText: inputName,
              hintText: placeHolder,
              labelStyle: Theme.of(context).textTheme.bodySmall,
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
