import 'package:flutter/material.dart';

class HomepagePage extends StatefulWidget {
  const HomepagePage({super.key});

  @override
  State<HomepagePage> createState() => _HomepagePageState();
}

class _HomepagePageState extends State<HomepagePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Welcome to PapDaew'),
    );
  }
}
