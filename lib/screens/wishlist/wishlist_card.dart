import 'package:flutter/material.dart';
import 'package:solehub/models/products.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/user_constants.dart';
import '../../services/wishlist_service.dart';
import '../product_details/product_details_screen.dart';

class WishlistCard extends StatelessWidget {
  final Products product;
  final VoidCallback onRemove;

  const WishlistCard({
    super.key,
    required this.product,
    required this.onRemove
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product,),
          ),
        );
      },
      child: Container(
        width: 160,
        height: 220,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 107,
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BEST SELLER',
                        style: TextStyle(
                          fontFamily: 'Airbnb Cereal',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        product.name,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Airbnb Cereal',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.text,
                          height: 2,
                        ),
                      ),
                      Text(
                        '₹${product.price}',
                        style: TextStyle(
                          fontFamily: 'Airbnb Cereal',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: AppColors.text,
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: IconButton(
                  onPressed: onRemove,
                  icon: const Icon(
                    Icons.favorite,
                  ),
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}