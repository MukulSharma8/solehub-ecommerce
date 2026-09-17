import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {

  Future<String?> register(
      String name,
      String email,
      String password,
      ) async {

    final response = await http.post(
      Uri.parse('http://10.0.2.2:9000/api/users'),
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
  Future<bool> login(
      String email,
      String password,
      ) async {

    final response = await http.post(
      Uri.parse('http://10.0.2.2:9000/api/users/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}