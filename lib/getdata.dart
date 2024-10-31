import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Getdata extends StatefulWidget {
  const Getdata({super.key});

  @override
  State<Getdata> createState() => _GetdataState();
}

class _GetdataState extends State<Getdata> {
  String result = "Tidak Ada Data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD DATA"),
        backgroundColor: Colors.purple[200],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$result"),
            ElevatedButton(
              onPressed: ()async {
                var res = await http.get(Uri.parse("https://reqres.in/api/users/2"));
                
                if(res.statusCode == 200){
                  Map<String,dynamic> data = json.decode(res.body) as Map<String,dynamic>;

                  setState(() {
                    result =  '${data["data"]["email"]} - ${data["data"]["first_name"]} ${data["data"]["last_name"]}';
                  });
                } else {
                  setState(() {
                    result = "Gagal Mendapatkan Data";
                  });
                }
              }, 
              child: Text("GET")
            )
          ],
        ),
      )
    );
  }
}