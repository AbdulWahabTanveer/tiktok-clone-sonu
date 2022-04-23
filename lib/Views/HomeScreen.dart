import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/Constants.dart';
import 'package:tiktok_clone/Controllers/HomeController.dart';
import 'Widgets/VideoPlayerWidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();

    return PageView.builder(
      scrollDirection: Axis.vertical,
      controller: homeController.pageController,
      itemBuilder: (BuildContext context, int index) {
        return Stack(children: [
          //VideoPlayerWidget(
          //  videoURL: time1URL,
          //),
          Positioned(
            bottom: 0,
            left: 0,
            child: Column(
              children: [
                const Text(
                  "Username",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Username",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: const [
                    Icon(FeatherIcons.music),
                    Text(
                      "Username",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            right: 25,
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(FeatherIcons.heart,size: 15,),
                SizedBox(height: 20,),
                Icon(FeatherIcons.command,size: 15,),
                SizedBox(height: 20,),
                Icon(FeatherIcons.share,size: 15,),
                SizedBox(height: 20,),
                Icon(Icons.devices_other_sharp,size: 15,),
              ],
            ),
          ),
        ]);
      },
    );
  }
}
