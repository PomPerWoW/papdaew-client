import 'package:flutter/material.dart';

class OtherservicesPage extends StatelessWidget {
  const OtherservicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Other Services"),
      ),
      body: Center(
        child: Text(
          "Welcome to the Other Services Page!",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}