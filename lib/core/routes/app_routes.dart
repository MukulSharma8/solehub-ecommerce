import 'package:flutter/material.dart';
import 'package:solehub/screens/auth/login_screen.dart';
import 'package:solehub/screens/auth/register_screen.dart';
import 'package:solehub/screens/home/home_screen.dart';
import 'package:solehub/screens/product_details/product_details_screen.dart';
import 'package:solehub/screens/profile/profile_screen.dart';
import '../../screens/cart/cart_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/register': (context) => const RegisterScreen(),
    '/login': (context) => const LoginScreen(),
    '/home': (context) => const HomeScreen(),
    '/cart': (context) => const CartScreen(),
    '/profile': (context) => const ProfileScreen()
  };
}