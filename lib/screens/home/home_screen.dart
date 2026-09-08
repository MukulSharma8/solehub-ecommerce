import 'package:flutter/material.dart';
import 'package:solehub/core/constants/app_colors.dart';
import 'package:solehub/widgets/bottom_nav_bar.dart';
import 'package:solehub/widgets/categories_section.dart';
import 'package:solehub/widgets/home_header.dart';
import 'package:solehub/widgets/new_arrival_banner.dart';
import 'package:solehub/widgets/popular_shoes_card.dart';
import 'package:solehub/widgets/popular_shoes_section.dart';
import 'package:solehub/widgets/search_bar.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                HomeHeader(),
                SizedBox(height: 20,),
                Searchbar(),
                SizedBox(height: 30,),
                CategoriesSection(),
                SizedBox(height: 30,),
                PopularShoesSection(),
                SizedBox(height: 20,),
                NewArrivalBanner()
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}