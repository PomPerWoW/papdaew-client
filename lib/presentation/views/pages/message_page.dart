import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:papdaew_client/logic/bloc/chat_bloc.dart';
import 'package:papdaew_client/logic/bloc/chat_event.dart';
import 'package:papdaew_client/logic/bloc/chat_state.dart';
import 'package:papdaew_client/logic/bloc/notification_bloc.dart';
import 'package:papdaew_client/logic/bloc/notification_state.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
              const SizedBox(height: 16),
              BlocBuilder<ChatBloc, ChatState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state.chats.isEmpty) {
                    return const Center(child: Text('No chats available'));
                  }
                  return Column(
                    children: state.chats.map((chat) => ChatBox(
                      chat: chat,
                      onMarkRead: () {
                        context.read<ChatBloc>().add(MarkChatRead(chat.id));
                      },
                    )).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatBox extends StatelessWidget {
  final ChatModel chat;
  final VoidCallback onMarkRead;

  const ChatBox({
    super.key,
    required this.chat,
    required this.onMarkRead,
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
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(chat.imagePath),
            radius: 24,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chat.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  chat.message,
                  style: TextStyle(
                    color: chat.messageNumber > 0 ? Colors.black : Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                formatDateTime(chat.datetime),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[400],
                ),
              ),
              const SizedBox(height: 10),
              if (chat.messageNumber > 0)
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        chat.messageNumber.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.mark_chat_read, size: 20),
                      color: Colors.grey,
                      onPressed: onMarkRead,
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}