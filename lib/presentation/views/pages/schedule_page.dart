import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class QueueItem {
  final String name;
  final String time;

  QueueItem({required this.name, required this.time});
}

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  bool isUpcomingSelected = true;

  final List<QueueItem> upcomingQueues = [
    QueueItem(name: 'Coffee Shop', time: '10:30 AM'),
    QueueItem(name: 'Dental Clinic', time: '11:00 AM'),
    QueueItem(name: 'SCB', time: '1:30 PM'),
    QueueItem(name: 'DINNING RESTAURANT', time: '05:00 PM'),
    QueueItem(name: 'Coffee Shop', time: '10:30 AM'),
    QueueItem(name: 'Dental Clinic', time: '02:00 PM'),
    QueueItem(name: 'Coffee Shop', time: '10:30 AM'),
    QueueItem(name: 'Dental Clinic', time: '02:00 PM'),

  ];

  final List<QueueItem> pastQueues = [
    QueueItem(name: 'Restaurant', time: '12:00 PM'),
    QueueItem(name: 'Barbershop', time: '03:45 PM'),
    QueueItem(name: 'Restaurant', time: '12:00 PM'),
    QueueItem(name: 'Barbershop', time: '03:45 PM'),
    QueueItem(name: 'Restaurant', time: '12:00 PM'),
    QueueItem(name: 'Barbershop', time: '03:45 PM'),
    QueueItem(name: 'Restaurant', time: '12:00 PM'),
    QueueItem(name: 'Barbershop', time: '03:45 PM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Queue',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Inter",
          ),
        ),
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CircleAvatar(
              backgroundColor: const Color(0xFFCCE3DE),
              child: IconButton(
                icon: const Icon(Icons.notifications),
                color: const Color(0xFF6B9080),
                onPressed: () {},
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
                children: [
                  SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50,
                          child: SearchBar(
                            leading: const Icon(Icons.search),
                            hintText: 'Search',
                            backgroundColor: MaterialStateProperty.all(Colors.grey[50]),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: 16),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isUpcomingSelected = true;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: isUpcomingSelected ? Colors.green : Colors.transparent,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Upcoming',
                                  style: TextStyle(
                                    color: isUpcomingSelected ? Colors.white : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isUpcomingSelected = false;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: !isUpcomingSelected ? Colors.green : Colors.transparent,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Past',
                                  style: TextStyle(
                                    color: !isUpcomingSelected ? Colors.white : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: 16),
                  
                  Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero, // Prevent extra padding
                itemCount: isUpcomingSelected ? upcomingQueues.length : pastQueues.length,
                itemBuilder: (context, index) {
                  final queue = isUpcomingSelected ? upcomingQueues[index] : pastQueues[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: Icon(Icons.schedule, color: Colors.green, size: 30),
                      title: Text(
                        queue.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Time: ${queue.time}',
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: 18,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}