import 'package:equatable/equatable.dart';

class QueueItem extends Equatable {
  final String imageUrl; // For the event image
  final String num; // New field for queue number
  final String date;
  final String eventName;
  final String location;

  QueueItem({
    required this.imageUrl,
    required this.num,
    required this.date,
    required this.eventName,
    required this.location,
  });

  @override
  List<Object?> get props => [imageUrl, num, date, eventName, location];
}

class QueueState extends Equatable {
  final List<QueueItem> queues;
  final bool isUpcoming;

  QueueState({
    required this.queues,
    required this.isUpcoming,
  });

  QueueState copyWith({
    List<QueueItem>? queues,
    bool? isUpcoming,
  }) {
    return QueueState(
      queues: queues ?? this.queues,
      isUpcoming: isUpcoming ?? this.isUpcoming,
    );
  }

  @override
  List<Object?> get props => [queues, isUpcoming];
}