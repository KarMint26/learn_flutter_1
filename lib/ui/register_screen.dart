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
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: "Password"
                ),
              ),
              TextFormField(
                controller: _retypePasswordController,
                decoration: const InputDecoration(
                  labelText: "Retype Password"
                ),
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