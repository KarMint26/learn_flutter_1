import 'package:flutter/material.dart';

void main(){
  runApp(const MyBottomNavBarC());
}

class MyBottomNavBarC extends StatelessWidget {
  const MyBottomNavBarC({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bottom Navbar Example',
      home: MyBottomNavBar(),
    );
  }
}

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});
  
  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Example'),
        backgroundColor: Colors.lime,
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.all(16),
                height: 200,
                width: 500,
                child: Column(
                  children: [
                    Text('This is a Bottom Sheet'),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Close'),
                    ),
                  ],
                ),
              );
            },
          );
        }, child: Text("Bottom Sheet")),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.lime,
        selectedItemColor: Colors.white,
      ),
    );
  }
}