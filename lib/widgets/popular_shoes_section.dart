import 'package:flutter/material.dart';
import 'package:solehub/core/constants/app_colors.dart';
import 'package:solehub/widgets/popular_shoes_card.dart';

class PopularShoesSection extends StatelessWidget {
  const PopularShoesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Popular Shoes', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, color: AppColors.text, fontSize: 16 ),),
            Spacer(),
            Text('See all', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w400, color: AppColors.primary, fontSize: 16 ),),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: PopularShoesCard(img: 'assets/images/preview/Jordan.png'),
            );
          }),
        ),
      ],
    );
  }
}
