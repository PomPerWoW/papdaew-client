import 'package:flutter/material.dart';
import 'package:papdaew_client/data/notifier.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.transparent, // Remove the default hover background

            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
              (Set<WidgetState> states) {
                return TextStyle(
                  color: states.contains(WidgetState.selected) ? Colors.white54 : Colors.black,
                  fontWeight: FontWeight.bold,
                );
              },
            ),
            iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
              (Set<WidgetState> states) {
                return IconThemeData(
                  color: states.contains(WidgetState.selected) ? Colors.white54 : Colors.black,
                );
              },
            ),
          ),
          child: NavigationBar(
            backgroundColor: Color(0xFFCCE3DE),
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.calendar_today), label: 'Schedule'),
              NavigationDestination(icon: Icon(Icons.message), label: 'Message'),
              NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
            ],
            onDestinationSelected: (int value) {
              selectedPageNotifier.value = value;
            },
            selectedIndex: selectedPage,
            height: MediaQuery.of(context).size.height * 0.08,
          ),
        );
      },
    );
  }
}
