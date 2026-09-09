import 'package:flutter/material.dart';
import 'package:solehub/core/constants/app_colors.dart';
import 'package:solehub/screens/product_details/product_details_screen.dart';

class PopularShoesCard extends StatelessWidget {
  final String img;
  const PopularShoesCard({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductDetailScreen())
        );},
      child: Container(
        width: 160,
        height: 220,
        padding: EdgeInsets.only(top: 12, left: 12),
        decoration: BoxDecoration(
            color: AppColors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Stack(
          children: [
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                  height: 107,
                  child: Image.asset(img, fit: BoxFit.contain,)),
              Text('BEST SELLER', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w400, fontSize: 12, color: AppColors.primary,),),
              Text('NIKE JORDAN', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.text, height: 2)),
              Text('493.00', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.text, height: 2)),
            ],
          ),
            Positioned(
              bottom: 0,
                right: 0,
                child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(15))
              ),
              child: IconButton(onPressed: (){}, icon: Icon(Icons.add), color: AppColors.white,),
            ))
        ]
        ),
      ),
    );
  }
}
