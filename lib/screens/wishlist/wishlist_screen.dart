import 'package:flutter/material.dart';
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
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.keyboard_return)),
        title: Row(
          children: [
            Text('Wishlist'),
            Spacer(),
            Icon(Icons.favorite_border)
          ],
        )

      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(16),

        itemCount: wishlist.length,

        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 160 / 220,
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