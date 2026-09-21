import 'package:solehub/models/products.dart';

class CartItem {
  final String id;
  final String userId;
  final Products product;
  final int size;
  final int quantity;

  CartItem({
    required this.id,
    required this.userId,
    required this.product,
    required this.size,
    required this.quantity,
  });

  CartItem.fromJson(Map<String, dynamic> json)
      : id = json["_id"],
        userId = json["userId"],
        product = Products.fromJson(json["productId"]),
        size = json["size"],
        quantity = json["quantity"];
}