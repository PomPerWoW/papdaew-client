import 'package:equatable/equatable.dart';

class ChatState extends Equatable {
  final List<ChatModel> chats;
  final bool isLoading;

  const ChatState({
    this.chats = const [],
    this.isLoading = false,
  });

  ChatState copyWith({
    List<ChatModel>? chats,
    bool? isLoading,
  }) {
    return ChatState(
      chats: chats ?? this.chats,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  int get totalUnreadMessages => chats.fold(0, (sum, chat) => sum + chat.messageNumber);

  @override
  List<Object> get props => [chats, isLoading];
}

class ChatModel {
  final int id;
  final String imagePath;
  final String name;
  final String message;
  final String datetime;
  final int messageNumber;

  const ChatModel({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.message,
    required this.datetime,
    this.messageNumber = 0,
  });

  ChatModel copyWith({int? messageNumber}) {
    return ChatModel(
      id: id,
      imagePath: imagePath,
      name: name,
      message: message,
      datetime: datetime,
      messageNumber: messageNumber ?? this.messageNumber,
    );
  }
}