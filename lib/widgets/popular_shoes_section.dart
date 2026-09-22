import 'package:flutter/material.dart';
import 'package:solehub/core/constants/app_colors.dart';
import 'package:solehub/models/products.dart';
import 'package:solehub/screens/all_products/all_products_screen.dart';
import 'package:solehub/widgets/popular_shoes_card.dart';

import '../core/constants/user_constants.dart';
import '../models/wishlist_item.dart';
import '../services/product_service.dart';
import '../services/wishlist_service.dart';
class PopularShoesSection extends StatefulWidget {
  const PopularShoesSection({super.key});

  @override
  State<PopularShoesSection> createState() => _PopularShoesSectionState();
}

class _PopularShoesSectionState extends State<PopularShoesSection> {
  final ProductService productService = ProductService();

  List<Products> products = [];
  List<WishlistItem> wishlist = [];
  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    final data = await productService.getProducts();
    wishlist = await WishlistService().getWishlist(
      UserConstants.userId,
    );
    setState(() {
      products = data;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Popular Shoes', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, color: AppColors.text, fontSize: 16 ),),
            Spacer(),
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AllProductsScreen()));
                },
            child: Text('See all', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w400, color: AppColors.primary, fontSize: 16 ),)),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length, itemBuilder: (context, index){
                final product = products[index];
            return Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: PopularShoesCard(
                product: product,
                isWishlisted: wishlist.any(
                      (item) => item.product.id == products[index].id,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
