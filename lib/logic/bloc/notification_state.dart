import 'package:equatable/equatable.dart';

class NotificationState extends Equatable {
  final List<NotificationModel> notifications;
  final bool isLoading;

  const NotificationState({
    this.notifications = const [],
    this.isLoading = false,
  });

  NotificationState copyWith({
    List<NotificationModel>? notifications,
    bool? isLoading,
  }) {
    return NotificationState(
      notifications: notifications ?? this.notifications,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  int get unreadCount => notifications.where((n) => !n.isRead).length;

  @override
  List<Object> get props => [notifications, isLoading];
}

class NotificationModel {
  final int id;
  final String title;
  final String message;
  final bool isRead;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    this.isRead = false,
  });

  NotificationModel copyWith({bool? isRead}) {
    return NotificationModel(
      id: id,
      title: title,
      message: message,
      isRead: isRead ?? this.isRead,
    );
  }
}