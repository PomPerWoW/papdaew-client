import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papdaew_client/logic/bloc/notification_event.dart';
import 'package:papdaew_client/logic/bloc/notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const NotificationState()) {
    on<LoadNotifications>(_onLoadNotifications);
    on<MarkNotificationRead>(_onMarkNotificationRead);
  }

  void _onLoadNotifications(
    LoadNotifications event,
    Emitter<NotificationState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    final notifications = [
      NotificationModel(id: 1, title: "New Message", message: "You have a new chat"),
      NotificationModel(id: 2, title: "Order Update", message: "Your order is on the way"),
      NotificationModel(id: 3, title: "Promotion", message: "50% off today"),
      NotificationModel(id: 4, title: "New Message", message: "You have a new chat"),
      NotificationModel(id: 5, title: "Order Update", message: "Your order is on the way"),
      NotificationModel(id: 6, title: "Promotion", message: "50% off today"),
      NotificationModel(id: 7, title: "New Message", message: "You have a new chat"),
      NotificationModel(id: 8, title: "Order Update", message: "Your order is on the way"),
      NotificationModel(id: 9, title: "Promotion", message: "50% off today"),
      NotificationModel(id: 10, title: "New Message", message: "You have a new chat"),
      NotificationModel(id: 11, title: "Order Update", message: "Your order is on the way"),
      NotificationModel(id: 12, title: "Promotion", message: "50% off today"),
    ];

    emit(state.copyWith(
      notifications: notifications,
      isLoading: false,
    ));
  }

  void _onMarkNotificationRead(
    MarkNotificationRead event,
    Emitter<NotificationState> emit,
  ) {
    final updatedNotifications = state.notifications.map((notification) {
      if (notification.id == event.notificationId) {
        return notification.copyWith(isRead: true);
      }
      return notification;
    }).toList();

    emit(state.copyWith(notifications: updatedNotifications));
  }
}