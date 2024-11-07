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

  void _register(){
    if(_formKey.currentState!.validate()){
      print(_nameController.text);
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
                decoration: const InputDecoration(
                  labelText: "Name"
                ),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Please enter your name";
                  }
          
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email"
                ),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Please enter your email";
                  }
          
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password"
                ),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Please enter your password";
                  }
          
                  return null;
                },
              ),
              TextFormField(
                controller: _retypePasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Retype Password"
                ),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Please enter retype password";
                  }
          
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: (){
                  _register();
                },
                child: const Text("Register")
              )
            ],
          ),
        ),
      ),
    );
  }
}