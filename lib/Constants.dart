import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'Views/UploadVideoScreen.dart';
import 'Views/HomeScreen.dart';
import 'Views/MainScreen.dart';
import 'Views/MessageScreen.dart';
import 'Views/ProfileScreen.dart';


//HomeScreen Pages List
final pages =  [
  HomeScreen(),
  ProfileScreen(),
  Center(child: Text("This Text Should Not Be Displayed Error.")),
  MessageScreen(),
  ProfileScreen(),
];



//Ui Color Constants
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;


//ShortHands for Firebase
var authInstance = FirebaseAuth.instance;
var fireStoreInstance = FirebaseFirestore.instance;
var storageInstance = FirebaseStorage.instance;

String time1URL = "https://firebasestorage.googleapis.com/v0/b/tiktok-clone-sonu.appspot.com/o/Videos%2Fvideo%20%230?alt=media&token=f188ef7d-a6e8-43ad-a698-12a6490d91fe";