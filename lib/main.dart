import 'package:first_project/detail_screen.dart';
import 'package:first_project/home_screen.dart';
import 'package:first_project/login_screen.dart';
import 'package:first_project/register_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: RegisterScreen()
      ),
    );
  }
}