import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/Views/auth/LoginScreen.dart';
import '../../Constants.dart';
import '../../Controllers/authController.dart';
import '../Widgets/TextInputField.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 70, 40, 0),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                const Text("TikTok",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 72,
                    )),
                const SizedBox(
                  height: 25,
                ),
                Stack(
                  children: [
                    CircleAvatar(
                      child: Image.asset("Assets/person.png"),
                      maxRadius: 64,
                    ),
                    Positioned(
                      bottom: -10,
                        left: 88,
                        child: IconButton(
                      icon: const Icon(Icons.add_a_photo),
                      onPressed: () {
                        authController.pickImage();
                      },
                    ))
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                TextInputField(
                  controller: authController.usernameController,
                  labelText: "Username",
                  icon: Icons.person,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextInputField(
                  controller: authController.emailController,
                  labelText: "Email",
                  icon: Icons.email,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextInputField(
                  controller: authController.passController,
                  labelText: "Password",
                  icon: Icons.lock,
                  isObscure: true,
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    if (kDebugMode) {
                      print("Register");
                    }
                    Get.snackbar("SignUp Message", "Success");
                  },
                  child: GestureDetector(
                    onTap: (){
                      authController.signUp();
                    },
                    child: Container(
                      color: buttonColor,
                      width: Get.width,
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("SignUp",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 20),
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.offAll(()=>LoginScreen());
                        },
                        child: Text(
                          " Login",
                          style: TextStyle(
                              color: buttonColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ],
            )),
      ),
    );

  }
}
