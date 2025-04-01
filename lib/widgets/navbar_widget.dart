import 'package:flutter/material.dart';
import 'package:papdaew_client/data/notifier.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: navbarIndexNotifier,
      builder: (context, selectedIndex, child) {
        return NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            navbarIndexNotifier.value = index; // Update navbar index
            selectedPageNotifier.value = index; // Switch to main tab, overriding sub-pages
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.schedule),
              label: 'Schedule',
            ),
            NavigationDestination(
              icon: Icon(Icons.message),
              label: 'Messages',
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}