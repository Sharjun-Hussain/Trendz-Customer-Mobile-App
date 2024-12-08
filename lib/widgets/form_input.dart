import 'package:flutter/material.dart';
import 'package:trendz_customer/theming/app_colors.dart';

class FormInput extends StatelessWidget {
  final String inputName;
  final String placeHolder;
  final Widget icon;
  const FormInput(
      {super.key,
      required this.inputName,
      required this.placeHolder,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
                autofocus: true,
                style: Theme.of(context).textTheme.bodySmall,
                decoration: InputDecoration(
                    labelText: inputName,
                    hintText: placeHolder,
                    labelStyle: Theme.of(context).textTheme.bodySmall,
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor)))),
          ],
        ));
  }
}
