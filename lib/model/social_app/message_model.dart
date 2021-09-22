class MessageModel {
  String senderId;
  String receiverId;
  String text;
  String dateTime;
  String chatImage;

  MessageModel({
    this.senderId,
    this.receiverId,
    this.text,
    this.dateTime,
    this.chatImage,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    text = json['text'];
    dateTime = json['dateTime'];
    chatImage = json['chatImage'];
  }

  Map<String, dynamic> toMap() {
    return {
      'dateTime': dateTime,
      'text': text,
      'receiverId': receiverId,
      'chatImage': chatImage,
      'senderId': senderId,
    };
  }
}
