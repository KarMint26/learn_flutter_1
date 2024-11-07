import 'package:first_project/services/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _retypePasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var token = '';
  String? _nameError;
  String? _emailError;
  String? _passwordErr;

  // Fungsi untuk melakukan registrasi
  void _register(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      // Mengecek apakah password dan retype password sama
      if (_passwordController.text == _retypePasswordController.text) {
        try {
          final response = await AuthService().register(
            _nameController.text,
            _emailController.text,
            _passwordController.text,
          );

          if(response["status"]){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(response["message"])),
            );

            Navigator.pushReplacementNamed(context, '/home');
          } else {
            setState(() {
              _nameError = response["error"]["name"]?[0];
              _emailError = response["error"]["email"]?[0];
              _passwordErr = response["error"]["password"]?[0];
            });
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Registration failed: $e")),
          );
        }
      } else {
        // Jika password dan retype password tidak sama
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Password do not match")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: const Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Name", errorText: _nameError),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email", errorText: _emailError),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password", errorText: _passwordErr),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _retypePasswordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Retype Password", errorText: _passwordErr),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter retype password";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  _register(context);
                },
                child: const Text("Register"),
              ),
              Text(token)
            ],
          ),
        ),
      ),
    );
  }
}
