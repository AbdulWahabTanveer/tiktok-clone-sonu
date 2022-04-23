import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:tiktok_clone/Models/VideoModel.dart';
import 'package:video_compress/video_compress.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import '../Constants.dart';
import '../Views/UploadVideoScreen.dart';

class UploadVideoController extends GetxController {
  late VideoPlayerController videoController;
  late ChewieController chewieController;
  TextEditingController captionController = TextEditingController();
  TextEditingController songNameController = TextEditingController();
  late ProgressDialog pd;

  Future<MediaInfo?> _compressVideo(XFile video) async {
    return await (VideoCompress.compressVideo(video.path,
        quality: VideoQuality.MediumQuality));
  }

  Future<String> _uploadVideo(String videoName, XFile video) async {
    MediaInfo? compressedVideo = await _compressVideo(video);
    Reference ref = storageInstance.ref().child('Videos').child(videoName);
    UploadTask uploadTask = ref.putFile(compressedVideo!.file!);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> _createUploadThumbnail(XFile video, String videoName) async {
    File thumbNail = await VideoCompress.getFileThumbnail(video.path);
    Reference ref = storageInstance.ref().child('thumbnails').child(videoName);
    UploadTask uploadTask = ref.putFile(thumbNail);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }


  Future<void> share(XFile video) async {
    try {
      pd.show(max: 100, msg: 'File Uploading...');
      String uid = authInstance.currentUser!.uid;
      DocumentSnapshot? userDoc = await fireStoreInstance
          .collection("users")
          .doc(uid)
          .get();
      var videoCollection = await fireStoreInstance.collection("videos").get();
      String videoName = "video #${videoCollection.docs.length}";
      String videoUrl = await _uploadVideo(videoName, video);
      String thumbNailUrl = await _createUploadThumbnail(video, videoName);
      VideoModel videoModel = VideoModel(uid: uid,
          caption: captionController.text,
          commentsCount: 0,
          like: [],
          shareCount: 0,
          userName: (userDoc!.data() as Map<String,dynamic>)['name'],
          videoName: videoName,
          profilePhoto: (userDoc!.data() as Map<String,dynamic>)['profilePic'],
          thumbnailUrl: thumbNailUrl,
          videoUrl: videoUrl,
          songName: songNameController.text,
      );
      await fireStoreInstance.collection("videos").doc(videoName).set(videoModel.toJson());
      pd.close();
      Get.back();
    } catch (e) {
      Get.snackbar('Error Uploading Video', e.toString());
    }
  }

  pickVideo(XFile video) async {
    videoController = VideoPlayerController.file(File(video!.path));
    chewieController = ChewieController(
      showOptions: true,
      materialProgressColors: ChewieProgressColors(
          handleColor: const Color.fromRGBO(235, 64, 52, 1),
          backgroundColor: Colors.white,
          bufferedColor: Colors.white),
      videoPlayerController: videoController,
      aspectRatio: Get.width / Get.height,
      autoPlay: true,
      looping: true,
    );
    Get.to(const UploadVideoScreen());
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    videoController!.dispose();
    chewieController!.dispose();
  }

}
