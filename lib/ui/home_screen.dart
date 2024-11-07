import 'package:first_project/services/session_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SessionService _sessionService = SessionService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: const Text("Home"),
      ),
      body: ElevatedButton(
        onPressed: () async{
          print(await _sessionService.getToken());
        }, 
        child: const Text("Show Token")
      )
    );
  }
}