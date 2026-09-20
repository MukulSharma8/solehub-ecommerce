import 'package:flutter/material.dart';
import 'package:solehub/core/constants/app_colors.dart';
import 'package:solehub/models/products.dart';
import 'package:solehub/screens/product_details/product_details_screen.dart';

import '../core/constants/user_constants.dart';
import '../services/wishlist_service.dart';

class PopularShoesCard extends StatelessWidget {
  final Products product;
  const PopularShoesCard({super.key,required this.product});

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
                  child: Image.asset(product.image, fit: BoxFit.contain,)),
              Text('BEST SELLER', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w400, fontSize: 12, color: AppColors.primary,),),
              Text(product.name, style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.text, height: 2)),
              Text('${product.price}', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.text, height: 2)),
            ],
          ),
            Positioned(
              bottom: 5,
                right: 0,
                child: Center(
                  child: IconButton(onPressed: () async {
                    await WishlistService().addToWishlist(
                      UserConstants.userId,
                      product.id,
                    );
                  }, icon: Icon(Icons.favorite_border_outlined), color: AppColors.subText,),
                ))
        ]
        ),
      ),
    );
  }
}
