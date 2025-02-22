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
      appBar: AppBar(
        title: Image.asset('assets/images/papdaewlogo.png', height: 30),
        actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: CircleAvatar(
                backgroundColor: Color(0xFFCCE3DE),
                child: IconButton(
                  icon: const Icon(Icons.notifications),
                  color: Color(0xFF6B9080),
                  onPressed: () {},
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: CircleAvatar(
                backgroundColor: Color(0xFFCCE3DE),
                child: IconButton(
                  icon: const Icon(Icons.person),
                  color: Color(0xFF6B9080),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),  
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

