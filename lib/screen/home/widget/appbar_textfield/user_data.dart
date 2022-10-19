import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  final String name;
  final String model;
  const User({required this.name, required this.model});

  static User fromJson(Map<String, dynamic> json) =>
      User(name: json['title'], model: json['model']);
}

class UserApi {
  static Future<List<User>> getUserSuggestions(String query) async {
    final url = Uri.parse('http://bikehunter.xyz/api/search');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List users = json.decode(response.body);

      return users.map((json) => User.fromJson(json)).where((user) {
        final nameLower = user.name.toLowerCase();
        final modeLower = user.model.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
