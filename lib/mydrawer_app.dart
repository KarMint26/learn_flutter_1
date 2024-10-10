import 'package:flutter/material.dart';

void main(){
  runApp(const MyDrawerAppC());
}

class MyDrawerAppC extends StatelessWidget {
  const MyDrawerAppC({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bottom Navbar Example',
      home: MyDrawerApp(),
    );
  }
}

class MyDrawerApp extends StatelessWidget {
  const MyDrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Drawer Example',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: const Center(child: Text('Swipe from the left to open the drawer')),
    );
  }
}