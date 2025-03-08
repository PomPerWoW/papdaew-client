import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papdaew_client/data/notifier.dart';
import 'package:papdaew_client/logic/bloc/chat_bloc.dart';
import 'package:papdaew_client/logic/bloc/chat_state.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.transparent,
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
              (Set<WidgetState> states) {
                return TextStyle(
                  color: states.contains(WidgetState.selected)
                      ? Colors.white54
                      : Colors.black,
                  fontWeight: FontWeight.bold,
                );
              },
            ),
            iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
              (Set<WidgetState> states) {
                return IconThemeData(
                  color: states.contains(WidgetState.selected)
                      ? Colors.white54
                      : Colors.black,
                );
              },
            ),
          ),
          child: NavigationBar(
            backgroundColor: const Color(0xFFCCE3DE),
            destinations: [
              const NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              const NavigationDestination(
                icon: Icon(Icons.calendar_today),
                label: 'Schedule',
              ),
              NavigationDestination(
                icon: BlocBuilder<ChatBloc, ChatState>(
                  builder: (context, state) {
                    // Only show badge if not on Message page (index 2)
                    if (selectedPage == 2) {
                      return const Icon(Icons.message);
                    }
                    return Badge(
                      label: Text('${state.totalUnreadMessages}'),
                      isLabelVisible: state.totalUnreadMessages > 0,
                      child: const Icon(Icons.message),
                    );
                  },
                ),
                label: 'Message',
              ),
              const NavigationDestination(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
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