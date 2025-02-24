import 'package:flutter/material.dart';
import 'package:papdaew_client/presentation/views/home_screen.dart';
import 'package:papdaew_client/presentation/views/pages/login_page.dart';
import 'package:papdaew_client/presentation/views/pages/signup_page.dart';
import 'package:papdaew_client/presentation/views/pages/restaurant_page.dart';
import 'package:papdaew_client/presentation/views/pages/hospital_page.dart';
import 'package:papdaew_client/presentation/views/pages/bank_page.dart';
import 'package:papdaew_client/presentation/views/pages/otherservices_page.dart';
import 'package:papdaew_client/presentation/views/pages/drivinglicense_page.dart';
import 'package:papdaew_client/presentation/views/pages/barbersalonspa_page.dart';
import 'package:papdaew_client/presentation/views/pages/governmentcomplex_page.dart';
import 'package:papdaew_client/presentation/views/pages/carrepair_page.dart';
import 'package:papdaew_client/presentation/views/pages/phonerepair_page.dart';
import 'package:papdaew_client/presentation/views/pages/stadiumfitness_page.dart';

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
          // main page
          case '/home':
            page = const HomeScreen();
            break;

          // authentication page
          case '/login':
            page = const LoginPage();
            break;
          case '/signup':
            page = const SignupPage();
            break;

          // categories on main page
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
          
          // services on otherservices page
          case '/drivinglicense':
            page = const DrivinglicensePage();
            break;
          case '/barbersalonspa':
            page = const BarberSalonSpaPage();
            break;
          case '/governmentcomplex':
            page = const GovernmentcomplexPage();
            break;
          case '/carrepair':
            page = const CarrepairPage();
            break;
          case '/phonerepair':
            page = const PhonerepairPage();
            break;
          case '/stadiumfitness':
            page = const StadiumfitnessPage();
            break;

          // default page
          default:
            page = const HomeScreen();
        }

        if (settings.name == '/restaurant' 
        || settings.name == '/hospital' 
        || settings.name == '/bank' 
        || settings.name == '/otherservices' 
        || settings.name == '/drivinglicense' 
        || settings.name == '/barbersalonspa'
        || settings.name == '/governmentcomplex' 
        || settings.name == '/carrepair' 
        || settings.name == '/phonerepair' 
        || settings.name == '/stadiumfitness') {
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
