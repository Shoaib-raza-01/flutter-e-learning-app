import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class Storage {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> uploadFile(String filePath, String fileName) async {
    File file = File(filePath);
    try {
      await storage.ref('profile/${FirebaseAuth.instance.currentUser!.uid}').putFile(file);
    } on FirebaseException catch (e) {
      Get.snackbar("Error", "Message : $e").show();
    }
  }
   
}
