import 'package:equatable/equatable.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class LoadNotifications extends NotificationEvent {}

class MarkNotificationRead extends NotificationEvent {
  final int notificationId;

  const MarkNotificationRead(this.notificationId);

  @override
  List<Object> get props => [notificationId];
}