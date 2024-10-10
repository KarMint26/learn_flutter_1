import 'package:flutter/material.dart';

void main() {
  runApp(const NavigatorExample());
}

class NavigatorExample extends StatelessWidget {
  const NavigatorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Navigator Example",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Navigator Example"),
          backgroundColor: Colors.pink[300],
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Menggunakan Navigator untuk mendorong halaman ProfilePage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
            child: const Text("Ke Halaman Profile"),
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page"),
        backgroundColor: Colors.amber[300],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Kembali ke halaman sebelumnya
            Navigator.pop(context);
          },
          child: const Text("Kembali Ke Home"),
        ),
      ),
    );
  }
}
