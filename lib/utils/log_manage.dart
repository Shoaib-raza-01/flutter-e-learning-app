import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:jsdc/main.dart';
import 'package:jsdc/screens/dashboard.dart';
import 'package:jsdc/screens/login_page.dart';
import 'package:provider/provider.dart';
// import 'package:get/get.dart';

class UserLogManagement extends StatelessWidget {
  const UserLogManagement({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    // ignore: unnecessary_null_comparison
    if(firebaseUser == null) return const HomePage();
    return const LoginPage();
    // return Scaffold(
    // body: StreamBuilder(
    //     stream: FirebaseAuth.instance.authStateChanges(),
    //     builder: (context, snapshots) {
    //       if (snapshots.connectionState == ConnectionState.waiting) {
    //         return const SplashScreen();
    //       } else if (snapshots.hasData) {
    //         return const HomePage();
    //       } else if (snapshots.hasError) {
    //         Get.snackbar("title", "message",
    //             snackPosition: SnackPosition.BOTTOM,
    //             titleText: const Text("Something went Wrong!"),
    //             messageText: const Text(
    //                 "Please check your internet connection and try again"),
    //             colorText: Colors.black87,
    //             backgroundColor: Colors.blue.shade200);
    //         return Container();
    //       } else {
    //         return const LoginPage();
    //       }
    //     }),

    // body: StreamBuilder(
    //       stream: FirebaseAuth.instance.authStateChanges(),
    //       builder: (context, snapshot) {
    //         if (snapshot.connectionState == ConnectionState.waiting) {
    //           return const Center(
    //             child: CircularProgressIndicator(),
    //           );
    //         } else if (snapshot.hasData) {
    //           return const HomePage();
    //         } else if (snapshot.hasError) {
    //           return const Center(
    //             child: Text("Something went wrong...."),
    //           );
    //         } else {
    //           return const LoginPage();
    //         }
    //       }),

//         body: ,
//       );
  }
}
