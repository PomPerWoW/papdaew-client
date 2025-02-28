import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
                'Message',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter",
                ),
              ),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                ChatBox(
                  imagePath: "assets/images/other.png",
                  name: "Roshan", 
                  message: "Miss seew so much", 
                  datetime: "2024-02-28T18:15:00",
                  messageNumber: 0,
                ),
                ChatBox(
                  imagePath: "assets/images/restaurant.png",
                  name: "Mint", 
                  message: "Miss roshan so much", 
                  datetime: "2024-02-28T14:15:00",
                  messageNumber: 1,
                ),
                ChatBox(
                  imagePath: "assets/images/other.png",
                  name: "Tong", 
                  message: "Miss Mint so much", 
                  datetime: "2024-02-28T14:15:00",
                  messageNumber: 4,
                ),
                ChatBox(
                  imagePath: "assets/images/bank.png",
                  name: "Seew", 
                  message: "Miss Tong so much", 
                  datetime: "2024-02-28T14:15:00",
                  messageNumber: 0,
                ),
                
              ],
            )
          ),
        ),
    );
  }
}


class ChatBox extends StatelessWidget {
  final String imagePath;
  final String name;
  final String message;
  final String datetime;
  final int messageNumber;
  final bool isDisabled;

  const ChatBox({
    super.key,
    this.imagePath = '',
    required this.name,
    required this.message,
    required this.datetime,
    this.messageNumber = 0,
    this.isDisabled = false,
  });

  String formatDateTime(String datetime) {
    DateTime messageTime = DateTime.parse(datetime);
    DateTime now = DateTime.now();
    
    Duration difference = now.difference(messageTime);
    
    if (difference.inHours < 24) {
      return DateFormat('HH:mm').format(messageTime);
    } else if (difference.inHours < 48 && now.day - messageTime.day == 1) {
      return 'Yesterday';
    } else {
      return DateFormat('dd/MM/yyyy').format(messageTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 24,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  message,
                  style: TextStyle(
                    color: messageNumber > 0 ? Colors.black : Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                formatDateTime(datetime), // Use the formatted datetime
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[400],
                ),
              ),
              SizedBox(height: 10),
              if (messageNumber > 0)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    messageNumber.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}