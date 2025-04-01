import 'package:flutter/material.dart';
import 'package:papdaew_client/data/notifier.dart';
import 'package:papdaew_client/presentation/views/pages/homepage_page.dart';
import 'package:papdaew_client/presentation/views/pages/profile_page.dart';
import 'package:papdaew_client/presentation/views/pages/schedule_page.dart';
import 'package:papdaew_client/presentation/views/pages/message_page.dart';
import 'package:papdaew_client/widgets/navbar_widget.dart';
import 'package:papdaew_client/presentation/views/pages/personaldata_page.dart';
import 'package:papdaew_client/presentation/views/pages/favorite_page.dart';
import 'package:papdaew_client/presentation/views/pages/security_page.dart';
import 'package:papdaew_client/presentation/views/pages/helpcenter_page.dart';
import 'package:papdaew_client/presentation/views/pages/contactus_page.dart';
import 'package:papdaew_client/presentation/views/pages/rateapp_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = [
    const HomepagePage(),
    const SchedulePage(),
    const MessagePage(),
    const ProfilePage(),
    const PersonalDataPage(),
    const FavoritesPage(),
    const PrivacySecurityPage(),
    const HelpCenterPage(),
    const ContactUsPage(),
    const RateAppPage(),
  ];

  @override
  void initState() {
    super.initState();
    navbarIndexNotifier.value = 0;
    selectedPageNotifier.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: selectedPageNotifier.value <= 3, // Allow pop only on main tabs
        onPopInvoked: (didPop) {
          if (!didPop && selectedPageNotifier.value > 3) {
            selectedPageNotifier.value = 3; // Go back to ProfilePage
          }
        },
        child: ValueListenableBuilder<int>(
          valueListenable: selectedPageNotifier,
          builder: (context, selectedPage, child) {
            // Only sync navbarIndexNotifier with main tabs (0-3)
            if (selectedPage <= 3) {
              navbarIndexNotifier.value = selectedPage;
            }
            return _pages.elementAt(selectedPage);
          },
        ),
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}