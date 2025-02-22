import 'package:flutter/material.dart';
import 'package:papdaew_client/presentation/views/home_screen.dart';
import 'package:papdaew_client/presentation/views/pages/login_page.dart';
import 'package:papdaew_client/presentation/views/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PapDaew',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const HomeScreen(),
      // home: const LoginPage(),
      // home: const SignupPage(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),

      },
    );
  }
}
