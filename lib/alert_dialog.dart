import 'package:flutter/material.dart';

void main(){
  runApp(const ADScreen());
}

class ADScreen extends StatelessWidget {
  const ADScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Course"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => {
            // showDialog(
            //   context: context, 
            //   builder: (BuildContext context) {
            //     return AlertDialog(
            //       title: const Text('Alert'),
            //       content: const Text('This is an alert dialog.'),
            //       actions: <Widget>[
            //         TextButton(
            //           child: const Text('Cancel'),
            //           onPressed: () {
            //             Navigator.of(context).pop();
            //           },
            //         ),
            //         TextButton(
            //           child: const Text('Ok'),
            //           onPressed: () {
            //             Navigator.of(context).pop();
            //           },
            //         ),
            //       ],
            //     );
            //   },
            // )
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('This is a SnackBar'),
                duration: Duration(seconds: 2),
                action: SnackBarAction(
                  label: "Ok", 
                  textColor: Colors.white,
                  onPressed: () => {}
                ),
                backgroundColor: Colors.blue,
              ),
            )
          },
          child: const Text("Show Snackbar")
        ),
      ),
    );
  }
}