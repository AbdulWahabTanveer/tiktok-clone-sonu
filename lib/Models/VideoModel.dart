import 'dart:convert';

class VideoModel {
  String songName;
  String videoName;
  int commentsCount;
  String uid;
  String caption;
  String userName;
  List like = [];
  int shareCount;
  String videoUrl;
  String thumbnailUrl;
  String profilePhoto;

  VideoModel(
      {required this.uid,
        required this.songName,
      required this.caption,
      required this.commentsCount,
      required this.like,
      required this.shareCount,
      required this.userName,
      required this.videoName,
      required this.profilePhoto,
      required this.thumbnailUrl,
      required this.videoUrl});

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      videoName: json["videoName"],
      commentsCount: int.parse(json["commentsCount"]),
      uid: json["uid"],
      caption: json["caption"],
      userName: json["userName"],
      like: List.of(json["like"])
          .map((i) => i /* can't generate it properly yet */)
          .toList(),
      shareCount: int.parse(json["shareCount"]),
      videoUrl: json["videoUrl"],
      thumbnailUrl: json["thumbnailUrl"],
      profilePhoto: json["profilePhoto"],
      songName:  json["songName"],
    );

  }

  Map<String, dynamic> toJson() {
    return {
      "videoName": videoName,
      "commentsCount": commentsCount,
      "uid": uid,
      "caption": caption,
      "userName": userName,
      "like": jsonEncode(like),
      "shareCount": shareCount,
      "videoUrl": videoUrl,
      "thumbnailUrl": thumbnailUrl,
      "profilePhoto": profilePhoto,
      "songName": songName,
    };
  }
//

}
