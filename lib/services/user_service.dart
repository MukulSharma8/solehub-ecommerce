import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserService {

  Future<String?> register(
      String name,
      String email,
      String password,
      ) async {

    final response = await http.post(
      Uri.parse('https://10.0.2.2:9000/api/users'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      return null;
    }

    final data = jsonDecode(response.body);

    return data['message'];
  }

  Future<User?> login(
      String email,
      String password,
      ) async {
    final response = await http.post(
      Uri.parse(
        'https://solehub-backend.onrender.com/api/users/login',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    print("STATUS: ${response.statusCode}");
    print("RESPONSE: ${response.body}");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return User.fromJson(data['user']);
    }

    return null;
  }
  Future<User> getUser(String userId) async {
    final response = await http.get(
      Uri.parse(
        'https://solehub-backend.onrender.com/api/users/$userId',
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return User.fromJson(data);
    } else {
      throw Exception("Failed to load user");
    }
  }
}