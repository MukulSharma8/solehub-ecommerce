import 'package:flutter/material.dart';
import 'package:solehub/core/constants/app_colors.dart';
import 'package:solehub/models/products.dart';
import 'package:solehub/services/product_service.dart';
import 'package:solehub/widgets/popular_shoes_card.dart';

import '../../core/constants/user_constants.dart';
import '../../models/wishlist_item.dart';
import '../../services/wishlist_service.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  List<Products> products = [];
  bool isLoading = true;
  List<WishlistItem> wishlist = [];
  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      List<Products> data = await ProductService().getProducts();
      List<WishlistItem> wishlistData =
      await WishlistService().getWishlist(
        UserConstants.userId,
      );
      setState(() {
        products = data;
        wishlist = wishlistData;
        isLoading = false;
      });

    }
    catch (error) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to load products'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.keyboard_return)),
        title: Text('View All', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, color: AppColors.text),),
      ),
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : products.isEmpty
          ? const Center(
        child: Text(
          'No products found',
          style: TextStyle(
            color: AppColors.subText,
          ),
        ),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 16,
          childAspectRatio: 0.72,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return PopularShoesCard(
            product: products[index],
            isWishlisted: wishlist.any(
                  (item) => item.product.id == products[index].id,
            ),
          );
        },
      ),
    );
  }
}