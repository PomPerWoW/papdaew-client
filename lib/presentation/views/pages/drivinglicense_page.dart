import 'package:flutter/material.dart';

class DrivinglicensePage extends StatefulWidget {
  const DrivinglicensePage({super.key});

  @override
  State<DrivinglicensePage> createState() => _DrivinglicensePageState();
}

class _DrivinglicensePageState extends State<DrivinglicensePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Driving license"),
      ),
    );
  }
}