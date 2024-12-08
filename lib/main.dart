import 'package:flutter/material.dart';
import 'package:trendz_customer/Pages/onboarding.dart';
import 'package:trendz_customer/theming/dark_theme.dart';
import 'package:trendz_customer/theming/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TrenZ Saloon',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        home: const Onboarding());
  }
}
