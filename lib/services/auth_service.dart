import 'dart:convert';

import 'package:first_project/models/response_model.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://recipe.incube.id/api';

class AuthService {
  Future register(String name, String email, String password) async{
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      body: {
        'name': name,
        'email': email,
        'password': password
      }
    );

    var res = ResponseModel.fromJson(jsonDecode(response.body));
    
    return res;
  }
}