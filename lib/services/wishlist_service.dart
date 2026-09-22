import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:solehub/models/wishlist_item.dart';
class WishlistService {
  Future<List<WishlistItem>> getWishlist(String userId) async {
    final response = await http.get(
      Uri.parse(
        'https://solehub-backend.onrender.com/api/users/$userId/wishlist',
      ),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<WishlistItem> wishlist = [];
      for (var item in data) {
        WishlistItem wishlistItem =
        WishlistItem.fromJson(item);
        wishlist.add(wishlistItem);
      }
      return wishlist;
    } else {
      throw Exception("Failed to load wishlist");
    }
  }
  Future<void> addToWishlist(
      String userId,
      String productId,
      ) async {

    final response = await http.post(
      Uri.parse(
        'https://solehub-backend.onrender.com/api/users/$userId/wishlist',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'productId': productId,
      }),
    );

    if (response.statusCode == 201) {
      print("Added to wishlist");
    } else {
      print("Failed to add to wishlist");
    }
  }
  Future<void> removeFromWishlist(
      String userId,
      String productId,
      ) async {
    final response = await http.delete(
      Uri.parse(
        'https://solehub-backend.onrender.com/api/users/$userId/wishlist/$productId',
      ),
    );

    if (response.statusCode == 200) {
      print("Removed from wishlist");
    } else {
      print("Failed to remove from wishlist");
    }
  }
}