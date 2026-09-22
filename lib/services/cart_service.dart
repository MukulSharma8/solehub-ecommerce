import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:solehub/models/cart_item.dart';

class CartService {

  Future<List<CartItem>> getCart(String userId) async {

    final response = await http.get(
      Uri.parse(
        'https://solehub-backend.onrender.com/api/users/$userId/cart',
      ),
    );

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      List<CartItem> cart = [];

      for (var item in data) {

        CartItem cartItem =
        CartItem.fromJson(item);

        cart.add(cartItem);
      }

      return cart;

    } else {

      throw Exception("Failed to load cart");
    }

  }

  Future<void> addToCart(
      String userId,
      String productId,
      int size,
      int quantity,
      ) async {

    final response = await http.post(
      Uri.parse(
        'https://solehub-backend.onrender.com/api/users/$userId/cart',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'productId': productId,
        'size': size,
        'quantity': quantity,
      }),
    );

    if (response.statusCode == 201) {
      print("Added to cart");
    } else {
      print("Failed to add to cart");

    }
  }
  Future<void> removeFromCart(
      String userId,
      String cartItemId,
      ) async {
    final response = await http.delete(
      Uri.parse(
        'https://solehub-backend.onrender.com/api/users/$userId/cart/$cartItemId',
      ),
    );

    if (response.statusCode == 200) {
      print("Removed from cart");
    } else {
      print("Failed to remove from cart");
      print(response.body);
    }
  }
}