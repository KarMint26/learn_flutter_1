import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostData extends StatefulWidget {
  const PostData({super.key});

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
  String result = 'Tidak Ada Data';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  // Fungsi untuk mengirim data ke server
  Future<void> postData() async {
    var response = await http.post(
      Uri.parse("https://reqres.in/api/users"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "name": nameController.text,
        "job": jobController.text,
      }),
    );

    // Memproses respons dan menampilkan hasilnya
    if (response.statusCode == 201) {
      var data = json.decode(response.body);
      setState(() {
        result = 'Name: ${data["name"]}, Job: ${data["job"]}';
      });
    } else {
      setState(() {
        result = 'Failed to post data';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD DATA"),
        backgroundColor: Colors.purple[200],
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                label: Text("Name"),
              ),
            ),
            TextField(
              controller: jobController,
              decoration: InputDecoration(
                label: Text("Job"),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: postData,
              child: Text("Save"),
            ),
            SizedBox(height: 20),
            Text(result),
          ],
        ),
      ),
    );
  }
}
