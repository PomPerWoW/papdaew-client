import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papdaew_client/logic/bloc/queue_bloc.dart';
import 'package:papdaew_client/logic/bloc/queue_event.dart';
import 'package:papdaew_client/logic/bloc/queue_state.dart';
import 'package:papdaew_client/logic/bloc/notification_bloc.dart';
import 'package:papdaew_client/logic/bloc/notification_state.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QueueBloc()..add(FetchUpcomingQueues()),
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/papdaewlogo.png', height: 30),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CircleAvatar(
                backgroundColor: const Color(0xFFCCE3DE),
                child: BlocBuilder<NotificationBloc, NotificationState>(
                  builder: (context, state) {
                    return Badge(
                      label: Text('${state.unreadCount}'),
                      isLabelVisible: state.unreadCount > 0,
                      child: IconButton(
                        icon: const Icon(Icons.notifications),
                        color: const Color(0xFF6B9080),
                        onPressed: () {
                          Navigator.pushNamed(context, '/notification');
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: CircleAvatar(
                backgroundColor: const Color(0xFFCCE3DE),
                child: IconButton(
                  icon: const Icon(Icons.person),
                  color: const Color(0xFF6B9080),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hi Inthat,',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Here are your past orders.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              BlocBuilder<QueueBloc, QueueState>(
                builder: (context, state) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              context.read<QueueBloc>().add(FetchUpcomingQueues());
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: state.isUpcoming ? Colors.green : Colors.transparent,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Upcoming',
                                style: TextStyle(
                                  color: state.isUpcoming ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              context.read<QueueBloc>().add(FetchPastQueues());
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: !state.isUpcoming ? Colors.green : Colors.transparent,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Past',
                                style: TextStyle(
                                  color: !state.isUpcoming ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<QueueBloc, QueueState>(
                  builder: (context, state) {
                    if (state.queues.isEmpty) {
                      return const Center(child: Text('No queues available.'));
                    }
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: state.queues.length,
                      itemBuilder: (context, index) {
                        final queue = state.queues[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 2,
                          child: Row(
                            children: [
                              // Left side: Image
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                ),
                                child: queue.imageUrl.isNotEmpty
                                    ? Image.network(
                                        queue.imageUrl,
                                        width: 100,
                                        height: 155,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Container(
                                            width: 100,
                                            height: 155,
                                            color: Colors.grey[300],
                                          );
                                        },
                                      )
                                    : Container(
                                        width: 100,
                                        height: 155,
                                        color: Colors.grey[300],
                                      ),
                              ),
                              // Right side: Details
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        queue.date,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        queue.eventName,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        queue.location,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Navigate to ticket details or perform action
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: const Text(
                                            'View Ticket',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}