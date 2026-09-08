import 'package:flutter/material.dart';
import 'package:solehub/core/constants/app_colors.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: AppColors.white,
        filled: true,
        suffixIcon: Icon(Icons.search),
        hintText: 'Looking for shoes',
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50)
      )
      ),
    );
  }
}
