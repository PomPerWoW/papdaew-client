import 'package:flutter_bloc/flutter_bloc.dart';
import 'queue_event.dart';
import 'queue_state.dart';

class QueueBloc extends Bloc<QueueEvent, QueueState> {
  QueueBloc() : super(QueueState(queues: [], isUpcoming: true)) {
    on<FetchUpcomingQueues>(_onFetchUpcomingQueues);
    on<FetchPastQueues>(_onFetchPastQueues);
  }

  final List<QueueItem> upcomingQueues = [
    QueueItem(
      imageUrl: 'https://example.com/valiant_masters.jpg', // Replace with actual image URL or asset path
      num: 'adssasad',
      date: '21 Feb',
      eventName: 'VALORANT Masters',
      location: 'Bangkok',
    ),
    QueueItem(
      imageUrl: 'https://example.com/valiant_masters.jpg',
      num: 'eqwewqewq',
      date: '2 Mar',
      eventName: 'VALORANT Masters',
      location: 'Bangkok',
    ),
  ];

  final List<QueueItem> pastQueues = [
    QueueItem(
      imageUrl: '',
      num: 'hfghgf',
      date: '25 Mar',
      eventName: 'Sound Check Festival 2023',
      location: '',
    ),
  ];

  void _onFetchUpcomingQueues(FetchUpcomingQueues event, Emitter<QueueState> emit) {
    emit(state.copyWith(queues: upcomingQueues, isUpcoming: true));
  }

  void _onFetchPastQueues(FetchPastQueues event, Emitter<QueueState> emit) {
    emit(state.copyWith(queues: pastQueues, isUpcoming: false));
  }
}