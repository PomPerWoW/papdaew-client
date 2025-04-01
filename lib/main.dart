import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papdaew_client/presentation/views/home_screen.dart';
import 'package:papdaew_client/presentation/views/pages/login_page.dart';
import 'package:papdaew_client/presentation/views/pages/signup_page.dart';
import 'package:papdaew_client/presentation/views/pages/restaurant_page.dart';
import 'package:papdaew_client/presentation/views/pages/hospital_page.dart';
import 'package:papdaew_client/presentation/views/pages/bank_page.dart';
import 'package:papdaew_client/presentation/views/pages/otherservices_page.dart';
import 'package:papdaew_client/presentation/views/pages/drivinglicense_page.dart';
import 'package:papdaew_client/presentation/views/pages/barbersalonspa_page.dart';
import 'package:papdaew_client/presentation/views/pages/idcardpassport_page.dart';
import 'package:papdaew_client/presentation/views/pages/carrepair_page.dart';
import 'package:papdaew_client/presentation/views/pages/phonerepair_page.dart';
import 'package:papdaew_client/presentation/views/pages/stadiumfitness_page.dart';
import 'package:papdaew_client/presentation/views/pages/restaurantselect_page.dart';
import 'package:papdaew_client/presentation/views/pages/notification_page.dart';
import 'package:papdaew_client/logic/bloc/notification_event.dart';
import 'package:papdaew_client/logic/bloc/notification_bloc.dart';
import 'package:papdaew_client/logic/bloc/chat_event.dart';
import 'package:papdaew_client/logic/bloc/chat_bloc.dart';
import 'package:papdaew_client/presentation/views/pages/bankselect_page.dart';
import 'package:papdaew_client/presentation/views/pages/hospitalselect_page.dart';
import 'package:papdaew_client/presentation/views/pages/personaldata_page.dart';
import 'package:papdaew_client/presentation/views/pages/favorite_page.dart';
import 'package:papdaew_client/presentation/views/pages/security_page.dart';
import 'package:papdaew_client/presentation/views/pages/helpcenter_page.dart';
import 'package:papdaew_client/presentation/views/pages/contactus_page.dart';
import 'package:papdaew_client/presentation/views/pages/rateapp_page.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NotificationBloc()..add(LoadNotifications()),
        ),
        BlocProvider(
          create: (context) => ChatBloc()..add(LoadChats()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PapDaew',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        ),
        home: const HomeScreen(),
        onGenerateRoute: (settings) {
          Widget page;
          switch (settings.name) {
            // Main page
            case '/home':
              page = const HomeScreen();
              break;

            // Authentication pages
            case '/login':
              page = const LoginPage();
              break;
            case '/signup':
              page = const SignupPage();
              break;

            // Categories on main page
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

            // Services on otherservices page
            case '/drivinglicense':
              page = const DrivinglicensePage();
              break;
            case '/barbersalonspa':
              page = const BarberSalonSpaPage();
              break;
            case '/idcardpassport':
              page = const IdcardPassportPage();
              break;
            case '/carrepair':
              page = const CarRepairPage();
              break;
            case '/phonerepair':
              page = const PhoneRepairPage();
              break;
            case '/stadiumfitness':
              page = const StadiumFitnessPage();
              break;

            // Vendor-specific page
            case '/restvendorspecific':
              page = const RestaurantSelectPage();
              break;

            // Notification
            case '/notification':
              page = const NotificationsPage();
              break;

            // Bank select page
            case '/bankselect':
              page = const BankSelectPage();
              break;

            // Hospital select page
            case '/hospitalselect':
              page = const HospitalSelectPage();
              break;

            // Profile-related pages (can still be accessed via deep linking)
            case '/personaldata':
              page = const PersonalDataPage();
              break;
            case '/favorites':
              page = const FavoritesPage();
              break;
            case '/privacysecurity':
              page = const PrivacySecurityPage();
              break;
            case '/helpcenter':
              page = const HelpCenterPage();
              break;
            case '/contactus':
              page = const ContactUsPage();
              break;
            case '/rateapp':
              page = const RateAppPage();
              break;

            // Default page
            default:
              page = const HomeScreen();
          }

          // Apply slide transition for specific routes
          if (settings.name == '/restaurant' ||
              settings.name == '/hospital' ||
              settings.name == '/bank' ||
              settings.name == '/otherservices' ||
              settings.name == '/drivinglicense' ||
              settings.name == '/barbersalonspa' ||
              settings.name == '/idcardpassport' ||
              settings.name == '/carrepair' ||
              settings.name == '/phonerepair' ||
              settings.name == '/stadiumfitness' ||
              settings.name == '/restvendorspecific' ||
              settings.name == '/bankselect' ||
              settings.name == '/hospitalselect' ||
              settings.name == '/personaldata' ||
              settings.name == '/favorites' ||
              settings.name == '/privacysecurity' ||
              settings.name == '/helpcenter' ||
              settings.name == '/contactus' ||
              settings.name == '/rateapp') {
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
            settings: settings,
          );
        },
      ),
    );
  }
}