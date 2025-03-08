import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papdaew_client/logic/bloc/chat_event.dart';
import 'package:papdaew_client/logic/bloc/chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatState()) {
    on<LoadChats>(_onLoadChats);
    on<MarkChatRead>(_onMarkChatRead);
  }

  Future<void> _onLoadChats(
    LoadChats event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    // Simulate API call (replace with real backend later)
    await Future.delayed(const Duration(seconds: 1));
    final chats = [
      ChatModel(
        id: 5,
        imagePath: "assets/images/bank.png",
        name: "Seew",
        message: "Miss Tong so much",
        datetime: "2024-02-28T14:15:00",
        messageNumber: 0,
      ),
      ChatModel(
        id: 6,
        imagePath: "assets/images/other.png",
        name: "Roshan",
        message: "Miss seew so much",
        datetime: "2024-02-28T18:15:00",
        messageNumber: 0,
      ),
      ChatModel(
        id: 7,
        imagePath: "assets/images/restaurant.png",
        name: "Mint",
        message: "Miss roshan so much",
        datetime: "2024-02-28T14:15:00",
        messageNumber: 1,
      ),
      ChatModel(
        id: 8,
        imagePath: "assets/images/other.png",
        name: "Tong",
        message: "Miss Mint so much",
        datetime: "2024-02-28T14:15:00",
        messageNumber: 4,
      ),
      ChatModel(
        id: 9,
        imagePath: "assets/images/bank.png",
        name: "Seew",
        message: "Miss Tong so much",
        datetime: "2024-02-28T14:15:00",
        messageNumber: 0,
      ),
    ];

    emit(state.copyWith(chats: chats, isLoading: false));
  }

  Future<void> _onMarkChatRead(
    MarkChatRead event,
    Emitter<ChatState> emit,
  ) async {
    final updatedChats = state.chats.map((chat) {
      if (chat.id == event.chatId) {
        return chat.copyWith(messageNumber: 0);
      }
      return chat;
    }).toList();

    emit(state.copyWith(chats: updatedChats));
  }
}