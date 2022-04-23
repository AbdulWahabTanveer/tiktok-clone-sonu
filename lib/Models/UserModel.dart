class UserModel {
  String name;
  String profilePic;
  String uid;
  String email;

  UserModel(
      {required this.name,
      required this.uid,
      required this.email,
      required this.profilePic});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      profilePic: json["profilePic"],
      uid: json["uid"],
      email: json["email"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "profilePic": profilePic,
      "uid": uid,
      "email": email,
    };
  }
//

}
