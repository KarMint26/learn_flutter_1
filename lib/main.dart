import 'package:first_project/dropdown_s.dart';
import 'package:first_project/my_bottom_nav_bar.dart';
import 'package:first_project/alert_dialog.dart';
import 'package:first_project/mydrawer_app.dart';
import 'package:first_project/nav_example.dart';
import 'package:first_project/tabbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const NavigatorExample());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int nilai = 0;

  void increment() {
    setState((){
      nilai++;
    });
  }

  void decrement() {
    setState((){
      nilai--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Counter",
            style: TextStyle(
              color: Colors.white
            ),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$nilai", 
              style: const TextStyle(fontSize: 40)
            ,),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              ElevatedButton(
                onPressed: () => {
                  setState(() {
                    decrement();
                  }),
                }, 
                child: const Icon(Icons.remove) 
              ),
              ElevatedButton(
                onPressed: () => {
                  setState(() {
                    increment();
                  }),
                }, 
                child: const Icon(Icons.add) 
              )
            ],)
          ],
        )
      ),
    );
  }
}