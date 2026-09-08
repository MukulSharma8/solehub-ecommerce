import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
        child: Image.asset('assets/images/preview/Categories.png', fit: BoxFit.cover,));
  }
}
