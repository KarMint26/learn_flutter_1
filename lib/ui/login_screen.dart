import 'package:first_project/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login(context)async {
    try {
      final response = await AuthService().login(
        _emailController.text,
        _passwordController.text,
      );

      if(response["status"]){
        Navigator.pushReplacementNamed(context, '/home');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response["message"])),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration failed: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Login"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: "Email"
            ),
            controller: _emailController,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: "Password"
            ),
            obscureText: true,
            controller: _passwordController,
          ),
          ElevatedButton(
            onPressed: (){
              _login(context);
            }, 
            child: const Text("Login")
          ),
          TextButton(
            onPressed: (){
              Navigator.pushNamed(context, '/register');
            },
            child: const Text("Don't have account? Login here")
          )
        ],
      )
    );
  }
}