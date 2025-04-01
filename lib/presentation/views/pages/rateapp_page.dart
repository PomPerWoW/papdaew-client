import 'package:flutter/material.dart';

class RateAppPage extends StatefulWidget {
  const RateAppPage({super.key});

  @override
  State<RateAppPage> createState() => _RateAppPageState();
}

class _RateAppPageState extends State<RateAppPage> {
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rate This App',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'How would you rate your experience?',
              style: TextStyle(
                color: Color(0xFF555555),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: "Inter",
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: const Color(0xFFA4C3B2),
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1.0;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 20),
            Text(
              _rating == 0
                  ? 'Tap the stars to rate'
                  : 'You rated $_rating stars!',
              style: const TextStyle(
                fontSize: 14,
                fontFamily: "Inter",
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Tell us more (optional)',
                hintStyle: const TextStyle(fontFamily: "Inter"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _rating == 0
                  ? null
                  : () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Thank you for your feedback!'),
                          backgroundColor: Color(0xFF6B9080),
                        ),
                      );
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6B9080),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text(
                'Submit Rating',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}