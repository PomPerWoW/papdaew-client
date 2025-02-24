import 'package:flutter/material.dart';

class PhonerepairPage extends StatefulWidget {
  const PhonerepairPage({super.key});

  @override
  State<PhonerepairPage> createState() => _PhonerepairPageState();
}

class _PhonerepairPageState extends State<PhonerepairPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone repair"),
      ),
    );
  }
}