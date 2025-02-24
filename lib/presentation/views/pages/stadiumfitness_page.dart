import 'package:flutter/material.dart';

class StadiumfitnessPage extends StatefulWidget {
  const StadiumfitnessPage({super.key});

  @override
  State<StadiumfitnessPage> createState() => _StadiumfitnessPageState();
}

class _StadiumfitnessPageState extends State<StadiumfitnessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stadium Fitness"),
      ),
    );
  }
}