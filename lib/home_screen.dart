import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('AGROLYN APP'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.supervised_user_circle),
            onPressed: () {
              // Add search functionality
            },
          ),
        ],
      ),
      drawer: Drawer(
        // Add navigation items in the drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Menu Pertama'),
              onTap: () {
                print("Hello World");
              },
            ),
            ListTile(
              title: const Text('Menu Kedua'),
              onTap: () {
                print("Hello World");
              },
            ),
          ],
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(18),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 items in a row
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.9,
        ),
        itemCount: 15, // Number of items in the grid
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network("https://images.unsplash.com/photo-1541623089466-8e777dd05d70?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                SizedBox(height: 5),
                Text('Mountain'),
                Text('Updated today', style: TextStyle(fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }
}