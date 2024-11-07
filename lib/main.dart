import 'package:first_project/ui/login_screen.dart';
import 'package:first_project/ui/home_screen.dart';
import 'package:first_project/ui/register_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RootScreen());
}

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/register': (context) => const RegisterScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen() 
      },
    );
  }
}