class PostModel {
  String name;
  String uID;
  String image;
  String date;
  String text;
  String postImage;

  PostModel({
    this.uID,
    this.name,
    this.image,
    this.text,
    this.date,
    this.postImage,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    uID = json['uId'];
    postImage = json['postImage'];
    text = json['text'];
    date = json['date'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'uId': uID,
      'postImage': postImage,
      'date': date,
      'text': text,
    };
  }
}
