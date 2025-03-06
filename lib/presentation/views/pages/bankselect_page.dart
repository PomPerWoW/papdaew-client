import 'package:flutter/material.dart';

class BankSelectPage extends StatefulWidget {
  const BankSelectPage({super.key});

  @override
  _BankSelectPageState createState() => _BankSelectPageState();
}

class _BankSelectPageState extends State<BankSelectPage> {
  String? selectedTransaction;
  String? selectedDate;
  String? selectedTime;

  final List<String> transactionTypes = ['Deposit', 'Withdraw', 'Loan Inquiry'];
  final List<String> availableDates = ['March 6', 'March 7', 'March 8'];
  final Map<String, List<String>> availableTimes = {
    'March 6': ['9:00 AM', '11:00 AM', '2:00 PM'],
    'March 7': ['10:00 AM', '12:00 PM', '3:00 PM'],
    'March 8': ['1:00 PM', '4:00 PM', '6:00 PM'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bank Info
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Bank/kasikorn.png'),
                  radius: 30,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Kasikorn Bank',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Remaining queues: 3',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 16, color: Colors.green),
                        SizedBox(width: 4),
                        Text('Robinson Ladkrabang', style: TextStyle(color: Colors.green)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(color: Colors.grey, thickness: 1),
            const SizedBox(height: 20),

            // Transaction Dropdown
            const Text(
              'Choose your type for transaction',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              items: transactionTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedTransaction = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Please choose',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200], // Light grey background
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              dropdownColor: Colors.white,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 20),

            // Date Dropdown
            const Text(
              'Choose a date',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              items: availableDates.map((date) {
                return DropdownMenuItem(
                  value: date,
                  child: Text(date),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedDate = value;
                  selectedTime = null; // Reset time when date changes
                });
              },
              decoration: InputDecoration(
                hintText: 'Please choose',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              dropdownColor: Colors.white,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 20),

            // Time Dropdown (only appears after selecting a Date)
            if (selectedDate != null) ...[
              const Text(
                'Choose a time slot',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                items: availableTimes[selectedDate]!.map((time) {
                  return DropdownMenuItem(
                    value: time,
                    child: Text(time),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedTime = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Please choose',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                dropdownColor: Colors.white,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 20),
            ],

            const Spacer(),

            // Reserve Button
           SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF525252),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/bank');
                },
                child: Text(
                  'Reserve',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
