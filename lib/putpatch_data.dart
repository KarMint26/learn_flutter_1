import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PutPatchData extends StatefulWidget {
  const PutPatchData({super.key});

  @override
  State<PutPatchData> createState() => _PutPatchDataState();
}

class _PutPatchDataState extends State<PutPatchData> {
  String result = 'Tidak Ada Data';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  // Fungsi untuk mengirim data ke server
  Future<void> PutPatchData() async {
    var response = await http.put(
      Uri.parse("https://reqres.in/api/users/2"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "name": nameController.text,
        "job": jobController.text,
      }),
    );

    // Memproses respons dan menampilkan hasilnya
    if (response.statusCode == 200) {
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
              onPressed: PutPatchData,
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
