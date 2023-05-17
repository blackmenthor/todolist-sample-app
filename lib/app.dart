import 'package:flutter/material.dart';
import 'package:flutter_uol_sample/onboarding/onboarding_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor:  const Color(0xFF24A19C),
            primary: const Color(0xFF24A19C)
        ),
        fontFamily: 'sf-pro',
        useMaterial3: true,
      ),
      home: const OnboardingPage(title: 'Flutter Demo Home Page'),
    );
  }
}