import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:tiktok_clone/Constants.dart';
import 'package:video_player/video_player.dart';

import '../Controllers/UploadVideoController.dart';
import '../Controllers/MainScreenController.dart';
import 'Widgets/TextInputField.dart';

class UploadVideoScreen extends StatelessWidget {
  const UploadVideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    UploadVideoController uploadVideoController = Get.put(UploadVideoController());
    MainScreenController homeController = Get.find<MainScreenController>();
    uploadVideoController.pickVideo(homeController.video!);

    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              width: Get.width,
              height: Get.height * 0.65,
              child: Chewie(
                    controller: uploadVideoController.chewieController!,
                  ),
            ),
            SizedBox(
              width: Get.width * .85,
              height: Get.height * .1,
              child: TextInputField(icon: Icons.message, labelText: 'Caption', controller: uploadVideoController.captionController,),
            ),
            SizedBox(
              width: Get.width * .85,
              height: Get.height * .1,
              child: TextInputField(icon: Icons.mic, labelText: 'Song', controller: uploadVideoController.songNameController,),
            ),
            GestureDetector(
              onTap: () {
                uploadVideoController.share(homeController.video!);
              },
              child: GestureDetector(
                onTap: (){
                  uploadVideoController.pd = ProgressDialog(context: context);
                  uploadVideoController.share(homeController.video!);
                },
                child: Container(
                  color: buttonColor,
                  width: Get.width *.85,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Share",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
