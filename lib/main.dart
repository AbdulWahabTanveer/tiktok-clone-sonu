import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/Bindings/InitialBindings.dart';
import 'Views/auth/LoginScreen.dart';
import 'Constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    home: const LoginScreen(),
    debugShowCheckedModeBanner: false,
    initialBinding: InitialBindings(),
    title: "Tiktok Clone",
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: backgroundColor,
    ),
  ));
}
