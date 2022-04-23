import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/Constants.dart';
import 'package:tiktok_clone/Controllers/UploadVideoController.dart';
import '../Controllers/HomeController.dart';
import '../Controllers/MainScreenController.dart';
import 'Widgets/CustomIcon.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainScreenController mainScreenController = Get.put(MainScreenController());
    HomeController homeController = Get.put(HomeController());

    return Obx(() => Scaffold(
          body: pages[mainScreenController.pageId.value],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              if (index == 2) {
                mainScreenController.pickVideo();
              } else {
                mainScreenController.pageIdChange(index);
              }
            },
            currentIndex: mainScreenController.pageId.value,
            backgroundColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: buttonColor,
            unselectedItemColor: Colors.white,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(icon: CustomIcon(), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), label: "Message"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        ));
  }
}
