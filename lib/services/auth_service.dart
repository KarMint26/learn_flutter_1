import 'dart:convert';

import 'package:first_project/models/response_model.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://recipe.incube.id/api';

class AuthService {
  Future<Map<String, dynamic>> register(String name, String email, String password) async{
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      body: {
        'name': name,
        'email': email,
        'password': password
      }
    );

    if(response.statusCode == 201){
      var res = ResponseModel.fromJson(jsonDecode(response.body));

      return {
        "status": true,
        "message": res.message,
      };
    } else if(response.statusCode == 422){
      var res = ResponseModel.fromJson(jsonDecode(response.body));

      Map<String, dynamic> err = res.errors as Map<String, dynamic>;

      return {
        "status": false,
        "message": res.message,
        "error": err,
      };
    } else {
      throw Exception("Filaed Register");
    }
  }
}