// notifications_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papdaew_client/logic/bloc/notification_event.dart';
import 'package:papdaew_client/logic/bloc/notification_state.dart';
import 'package:papdaew_client/logic/bloc/notification_bloc.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: BlocBuilder<NotificationBloc, NotificationState>(
              builder: (context, state) {
                return Badge(
                  label: Text('${state.unreadCount}'),
                  isLabelVisible: state.unreadCount > 0,
                  child: const Icon(Icons.notifications),
                );
              },
            ),
          ),
        ],
      ),
      body: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.notifications.isEmpty) {
            return const Center(child: Text('No notifications'));
          }

          return ListView.builder(
            itemCount: state.notifications.length,
            itemBuilder: (context, index) {
              final notification = state.notifications[index];
              return ListTile(
                title: Text(
                  notification.title,
                  style: TextStyle(
                    fontWeight: notification.isRead ? FontWeight.normal : FontWeight.bold,
                  ),
                ),
                subtitle: Text(notification.message),
                trailing: !notification.isRead
                    ? IconButton(
                        icon: const Icon(Icons.mark_chat_read),
                        onPressed: () {
                          context.read<NotificationBloc>().add(
                                MarkNotificationRead(notification.id),
                              );
                        },
                      )
                    : null,
                tileColor: notification.isRead ? null : Colors.grey[200],
              );
            },
          );
        },
      ),
    );
  }
}