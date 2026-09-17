import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/products.dart';

class ProductService {

  Future<List<Products>> getProducts() async {

    final response = await http.get(
      Uri.parse('http://10.0.2.2:9000/api/products'),
    );

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      List<Products> products = [];

      for (var item in data) {
        Products product = Products.fromJson(item);
        products.add(product);
      }

      return products;

    } else {
      throw Exception("Failed to load products");
    }
  }
}