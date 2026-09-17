import 'package:solehub/models/products.dart';

class WishlistItem {

  final String id;
  final String userId;
  final Products product;

  WishlistItem({
    required this.id,
    required this.userId,
    required this.product,
  });

  WishlistItem.fromJson(Map<String, dynamic> json)
      : id = json["_id"],
        userId = json["userId"],
        product = Products.fromJson(json["productId"]);
}