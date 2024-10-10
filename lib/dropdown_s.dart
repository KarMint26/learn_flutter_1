import 'package:flutter/material.dart';

void main() {
  runApp(const MyDropDownC());
}

class MyDropDownC extends StatelessWidget {
  const MyDropDownC({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Dropdown Example',
      home: MyDropDown(),
    );
  }
}

class MyDropDown extends StatefulWidget {
  const MyDropDown({super.key});

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  String? _selectedItem = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Example'),
        backgroundColor: Colors.purple[200],
      ),
      body: Center(
        child: DropdownButton<String>(
          value: _selectedItem,
          items: <String>['One', 'Two', 'Three'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedItem = newValue;
            });
          },
        ),
      ),
    );
  }
}
