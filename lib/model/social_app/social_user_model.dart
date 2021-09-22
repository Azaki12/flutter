class SocialUserModel {
  String name;
  String email;
  String phone;
  String uID;
  String image;
  String coverImage;
  String bio;
  bool isEmailVerified;

  SocialUserModel({
    this.uID,
    this.email,
    this.coverImage,
    this.phone,
    this.name,
    this.bio,
    this.isEmailVerified,
    this.image,
  });

  SocialUserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    image = json['image'];
    phone = json['phone'];
    coverImage = json['coverImage'];
    uID = json['uId'];
    bio = json['bio'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'bio': bio,
      'email': email,
      'coverImage': coverImage,
      'image': image,
      'uId': uID,
      'isEmailVerified': isEmailVerified,
    };
  }
}
