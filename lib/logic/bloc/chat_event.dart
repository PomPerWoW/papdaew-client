import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class LoadChats extends ChatEvent {}

class MarkChatRead extends ChatEvent {
  final int chatId;

  const MarkChatRead(this.chatId);

  @override
  List<Object> get props => [chatId];
}