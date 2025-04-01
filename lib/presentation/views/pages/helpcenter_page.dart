import 'package:flutter/material.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Help Center',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Inter",
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF6B9080)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'How can we assist you?',
                style: TextStyle(
                  color: Color(0xFF555555),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Inter",
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFCCE3DE).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Find answers to common questions or get support for your queue reservations.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontFamily: "Inter",
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Popular Topics',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter",
                ),
              ),
              const SizedBox(height: 10),
              _buildExpandableTile(
                title: 'How to Book a Queue?',
                content:
                    'To book a queue, go to the homepage, select a category (e.g., Restaurant), and follow the prompts to reserve your spot.',
              ),
              _buildExpandableTile(
                title: 'How to Cancel a Reservation?',
                content:
                    'Navigate to your profile, check your recent bookings, and cancel from there.',
              ),
              _buildExpandableTile(
                title: 'What is VIP Priority Access?',
                content:
                    'VIP users get priority in queues and additional features. Upgrade via the Profile page.',
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/contactus');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B9080),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    'Contact Support',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandableTile({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: "Inter",
            color: Colors.black,
          ),
        ),
        collapsedBackgroundColor: Colors.grey[100],
        backgroundColor: const Color(0xFFCCE3DE).withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              content,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: "Inter",
                color: Color(0xFF555555),
              ),
            ),
          ),
        ],
      ),
    );
  }
}