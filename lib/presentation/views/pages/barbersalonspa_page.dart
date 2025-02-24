import 'package:flutter/material.dart';

class BarberSalonSpaPage extends StatefulWidget {
  const BarberSalonSpaPage({super.key});

  @override
  State<BarberSalonSpaPage> createState() => _BarberSalonSpaPageState();
}

class _BarberSalonSpaPageState extends State<BarberSalonSpaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Barber/Salon/Spa"),
      ),
    );
  }
}