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

    print(response.body);
  }
}