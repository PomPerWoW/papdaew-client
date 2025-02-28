import 'package:flutter/material.dart';
import 'package:papdaew_client/data/notifier.dart';
import 'package:papdaew_client/presentation/views/pages/homepage_page.dart';
import 'package:papdaew_client/presentation/views/pages/profile_page.dart';
import 'package:papdaew_client/presentation/views/pages/schedule_page.dart';
import 'package:papdaew_client/presentation/views/pages/message_page.dart';
import 'package:papdaew_client/widgets/navbar_widget.dart';


List<Widget> pages = [
  HomepagePage(),
  SchedulePage(),
  MessagePage(),
  ProfilePage(),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier, 
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },                                  
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}

