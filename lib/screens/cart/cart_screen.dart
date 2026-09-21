import 'package:flutter/material.dart';
import 'package:solehub/core/constants/app_colors.dart';
import 'package:solehub/core/constants/user_constants.dart';
import 'package:solehub/models/cart_item.dart';
import 'package:solehub/services/cart_service.dart';
import 'cart_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> cart = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadCart();
  }

  Future<void> loadCart() async {
    try {
      List<CartItem> data = await CartService().getCart(
        UserConstants.userId,
      );

      setState(() {
        cart = data;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Failed to load cart"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.text,
          ),
        ),

        title: const Text(
          "My Cart",
          style: TextStyle(
            fontFamily: 'Airbnb Cereal',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.text,
          ),
        ),
      ),

      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : cart.isEmpty
          ? const Center(
        child: Text(
          "Your cart is empty",
          style: TextStyle(
            fontFamily: 'Airbnb Cereal',
            fontSize: 16,
            color: AppColors.subText,
          ),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: cart.length,
        itemBuilder: (context, index) {
          return CartCard(
            cartItem: cart[index],
            onDelete: () async{
              await CartService().removeFromCart(

                  UserConstants.userId,
                  cart[index].id);
              setState(() {
                cart.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }
}