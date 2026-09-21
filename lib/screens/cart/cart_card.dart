import 'package:flutter/material.dart';
import 'package:solehub/core/constants/app_colors.dart';
import 'package:solehub/models/cart_item.dart';
import 'package:solehub/screens/product_details/product_details_screen.dart';

class CartCard extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onDelete;

  const CartCard({
    super.key,
    required this.cartItem,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailScreen(product: cartItem.product)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            // Product image
            Container(
              height: 90,
              width: 90,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                cartItem.product.image,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(width: 14),

            // Product details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'Airbnb Cereal',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.text,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    '\$${cartItem.product.price}',
                    style: const TextStyle(
                      fontFamily: 'Airbnb Cereal',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.text,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    'Size: ${cartItem.size}   Quantity: ${cartItem.quantity}',
                    style: const TextStyle(
                      fontFamily: 'Airbnb Cereal',
                      fontSize: 12,
                      color: AppColors.subText,
                    ),
                  ),
                ],
              ),
            ),

            // Delete button
            IconButton(
              onPressed: onDelete,
              icon: const Icon(
                Icons.delete_outline,
                color: AppColors.subText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}