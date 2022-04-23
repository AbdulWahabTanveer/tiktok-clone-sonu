import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/Views/auth/RegisterScreen.dart';

import '../../Constants.dart';
import '../../Controllers/authController.dart';
import '../Widgets/TextInputField.dart';

class LoginScreen extends StatelessWidget {


  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    return Scaffold(
      body: Padding(
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
              const Text("Login",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 36,
                  )),
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
                  authController.login();
                },
                child: Container(
                  color: buttonColor,
                  width: Get.width,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
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
                    "Don't have an account?",
                    style: TextStyle(fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.offAll(() => RegisterScreen());
                    },
                      child: Text(
                    "   Register",
                    style: TextStyle(color: buttonColor, fontSize: 20,fontWeight: FontWeight.bold),
                  )),
                ],
              ),
            ],
          )),
    );
  }
}
