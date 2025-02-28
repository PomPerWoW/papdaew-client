import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message'),
        actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: CircleAvatar(
                backgroundColor: Color(0xFFCCE3DE),
                child: IconButton(
                  icon: const Icon(Icons.notifications),
                  color: Color(0xFF6B9080),
                  onPressed: () {},
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: CircleAvatar(
                backgroundColor: Color(0xFFCCE3DE),
                child: IconButton(
                  icon: const Icon(Icons.person),
                  color: Color(0xFF6B9080),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),  
    );
  }
}