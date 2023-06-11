
class DisplayChatModel{
  final String? msg;
  final int chatIndex;

  DisplayChatModel({required this.msg, required this.chatIndex});

  factory DisplayChatModel.fromJson(Map<String, dynamic> json) =>DisplayChatModel(
      msg: json['msg'],
      chatIndex: json['chatIndex']
  );
}