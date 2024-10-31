import 'package:first_project/delete_data.dart';
import 'package:first_project/getdata.dart';
import 'package:first_project/post_data.dart';
import 'package:first_project/putpatch_data.dart';
import 'package:flutter/material.dart';

class CrudEndpoint extends StatelessWidget {
  const CrudEndpoint({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabBar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DeleteData(),
    );
  }
}