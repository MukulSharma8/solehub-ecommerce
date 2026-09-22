import 'package:flutter/material.dart';
import 'package:solehub/core/constants/app_colors.dart';
import 'package:solehub/core/constants/user_constants.dart';
import 'package:solehub/models/wishlist_item.dart';
import 'package:solehub/services/wishlist_service.dart';
import './wishlist_card.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {

  List<WishlistItem> wishlist = [];

  @override
  void initState() {
    super.initState();
    loadWishlist();
  }

  Future<void> loadWishlist() async {

    final data = await WishlistService().getWishlist(
      UserConstants.userId,
    );

    setState(() {
      wishlist = data;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.only(left: 20),
            onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.keyboard_return)),
        title: Text('Wishlist', style: TextStyle(fontFamily: 'Airbnb Cereal', fontWeight: FontWeight.w500, color: AppColors.text),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border,)),
          )
        ],

      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(20),

        itemCount: wishlist.length,

        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 170 / 220,
        ),

        itemBuilder: (context, index) {

          return WishlistCard(
            product: wishlist[index].product,
            onRemove: () async{
              await WishlistService().removeFromWishlist(
                UserConstants.userId,
                wishlist[index].product.id,
              );
              setState(() {
                wishlist.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }
}