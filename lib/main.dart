import 'package:flutter/material.dart';
import 'package:papdaew_client/presentation/views/home_screen.dart';
import 'package:papdaew_client/presentation/views/pages/login_page.dart';
import 'package:papdaew_client/presentation/views/pages/signup_page.dart';
import 'package:papdaew_client/presentation/views/pages/restaurant_page.dart';
import 'package:papdaew_client/presentation/views/pages/hospital_page.dart';
import 'package:papdaew_client/presentation/views/pages/bank_page.dart';
import 'package:papdaew_client/presentation/views/pages/otherservices_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'PapDaew',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
//       ),
//       home: const HomeScreen(),
//       // home: const LoginPage(),
//       // home: const SignupPage(),
//       routes: {
//         '/home': (context) => const HomeScreen(),
//         '/login': (context) => const LoginPage(),
//         '/signup': (context) => const SignupPage(),
//         '/restaurant': (context) => const RestaurantPage(),
//       },
//     );
//   }
// }


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
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case '/home':
            page = const HomeScreen();
            break;
          case '/login':
            page = const LoginPage();
            break;
          case '/signup':
            page = const SignupPage();
            break;
          case '/restaurant':
            page = const RestaurantPage();
            break;
          case '/hospital':
            page = const HospitalPage();
            break;
          case '/bank':
            page = const BankPage();
            break;
          case '/otherservices':
            page = const OtherservicesPage();
            break;
          default:
            page = const HomeScreen();
        }

        if (settings.name == '/restaurant' || settings.name == '/hospital' || settings.name == '/bank' || settings.name == '/otherservices') {
          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;
              
              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);
              
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 300),
          );
        }

        return MaterialPageRoute(
          builder: (context) => page,
          settings: settings
        );
      },
    );
  }
}
