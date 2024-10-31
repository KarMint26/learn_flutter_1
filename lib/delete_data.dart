import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteData extends StatefulWidget {
  const DeleteData({super.key});

  @override
  State<DeleteData> createState() => _DeleteDataState();
}

class _DeleteDataState extends State<DeleteData> {
  int resData = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD DATA"),
        backgroundColor: Colors.purple[200],
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: ()async{
                  var response = await http.delete(
                    Uri.parse("https://reqres.in/api/users/2")
                  );

                   setState(() {
                      resData = response.statusCode;
                    });
              },
              child: Text("Hapus") 
            ),
            Text("$resData")
          ],
        )
      ),
    );
  }
}
