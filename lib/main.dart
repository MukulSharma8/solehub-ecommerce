import 'package:flutter/material.dart';
import 'package:solehub/screens/auth/forgot_pass_screen.dart';
import 'package:solehub/screens/auth/login_screen.dart';
import 'package:solehub/screens/auth/register_screen.dart';
import 'package:solehub/screens/home/home_screen.dart';
import 'package:solehub/screens/onboarding/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

