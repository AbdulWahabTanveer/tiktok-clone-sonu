import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/Constants.dart';
import 'package:tiktok_clone/Models/UserModel.dart';
import 'package:tiktok_clone/Views/MainScreen.dart';
import 'package:tiktok_clone/Views/auth/LoginScreen.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  late File? imageFile;
  late Rx<User?> userInstance;

  @override
  onReady(){
    super.onReady();
    userInstance = Rx<User?>(authInstance.currentUser);
    userInstance.bindStream(authInstance.authStateChanges());
    ever(userInstance, _setInitialScreen);
  }

  _setInitialScreen(User? user){
    if(user==null){
      Get.offAll(() => LoginScreen());
    }
    else{
      Get.offAll(() => MainScreen());
    }

  }
  Future<void> signUp() async {
    print(
        "${emailController.text.isNotEmpty} ${passController.text.isNotEmpty} + ${usernameController.text.isNotEmpty} + ${imageFile != null}");
    try {
      if (emailController.text.isNotEmpty &&
          passController.text.isNotEmpty &&
          usernameController.text.isNotEmpty &&
          imageFile != null) {
        UserCredential cred = await authInstance.createUserWithEmailAndPassword(
            email: emailController.text, password: passController.text);

        String downloadURL = await uploadImage(imageFile!);
        UserModel user = UserModel(
            name: usernameController.text,
            uid: cred.user!.uid,
            email: emailController.text,
            profilePic: downloadURL);

        await fireStoreInstance
            .collection("users")
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar("Error", "Please Enter Valid Data");
      }
    } catch (e) {
      Get.snackbar("Error While Creating Account", e.toString());
    }
  }

  Future<String> uploadImage(File image) async {
    Reference ref = storageInstance
        .ref()
        .child("ProfilePics")
        .child(authInstance.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadURL = await snap.ref.getDownloadURL();
    return downloadURL;
  }

  Future<void> pickImage() async {
    final localImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    imageFile = File(localImage!.path);
    Get.snackbar('Success', "Image Selected");
  }

  login() async {
    try{
      if(emailController.text.isNotEmpty && passController.text.isNotEmpty){
        UserCredential cred = await authInstance.signInWithEmailAndPassword(
            email: emailController.text, password: passController.text);
      }
      else {
        Get.snackbar("Error", "Please Enter Valid Data");
      }
    }
    catch(e){
      Get.snackbar("Error While Logging In", e.toString());
    }
  }
}
