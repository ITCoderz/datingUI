class MessagesModel {
  String  number, messages, messageType;
  bool isUserMessage;

  MessagesModel({
    required this.number,
    required this.messages,
    required this.messageType,
    required this.isUserMessage,
  });
}
