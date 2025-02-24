import 'package:flutter/material.dart';

class CarrepairPage extends StatefulWidget {
  const CarrepairPage({super.key});

  @override
  State<CarrepairPage> createState() => _CarrepairPageState();
}

class _CarrepairPageState extends State<CarrepairPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Car repair"),
      ),
    );
  }
}