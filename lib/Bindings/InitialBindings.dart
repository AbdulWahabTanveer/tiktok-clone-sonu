import 'package:get/get.dart';
import 'package:tiktok_clone/Controllers/authController.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {
  Get.put(AuthController());
  }

}