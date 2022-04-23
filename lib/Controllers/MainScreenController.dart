import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/Views/UploadVideoScreen.dart';
import 'package:video_player/video_player.dart';

class MainScreenController extends GetxController {
  late RxInt pageId = RxInt(0);
  late XFile? video;

  pageIdChange(int val) {
    pageId.value = val;
  }

  pickVideo() async {
    video = await ImagePicker().pickVideo(source: ImageSource.gallery);
    Get.snackbar("Video File", "Selected Successfully");
    if (video != null) {
      Get.to(UploadVideoScreen());
    }
  }
}
