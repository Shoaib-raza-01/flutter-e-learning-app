import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsdc/utils/firebase_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser;
  final stream = FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();
  String name = "User";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black26,
        body: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(children: [
                  Container(
                    height: 125,
                    width: 125,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      image: DecorationImage(
                        image: NetworkImage(
                          (user?.photoURL != null)
                              ? user!.photoURL!
                              : FirebaseStorage.instance
                                .ref('profile/${FirebaseAuth.instance.currentUser!.uid}').getDownloadURL().toString(),
                        ),
                        // image: NetworkImage((() {
                        //   if (user!.photoURL != null) {
                        //     return user!.photoURL!;
                        //   }
                        //   return 'assets/images/ph_logo.png';
                        // })()),
                        fit: BoxFit.fill,
                      ),
                    ),
                    // child: (user!.photoURL != null)
                    //   ? NetworkImage('${user!.photoURL}')
                    //   :
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () async {
                          try {
                            final result = await FilePicker.platform.pickFiles(
                                allowMultiple: false,
                                type: FileType.custom,
                                allowedExtensions: ['png', 'jpg']);

                            if (result == null) {
                              Get.snackbar("Error Uploading File",
                                      "It seems like you haven't selected any file to upload",
                                      snackPosition: SnackPosition.BOTTOM,
                                      duration: const Duration(seconds: 3),
                                      icon: const Icon(
                                          Icons.error_outline_rounded))
                                  .show();
                              return;
                            }
                            final path = result.files.single.path!;
                            final fileName = result.files.single.name;
                            final Storage storage = Storage();
                            storage
                                .uploadFile(path, fileName)
                                .then((value) => print("done"));
                          } catch (e) {
                            Get.snackbar('asd', "error occured $e").show();
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.shade600),
                          child: const Icon(
                            Icons.mode_edit_sharp,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      )),
                ]),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: (user!.displayName != null)
                      ? Text("${user!.displayName}")
                      : StreamBuilder(
                          stream: stream,
                          builder: (context, snapshot) {
                            try {
                              return Text("${snapshot.data?['name']}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),);
                            } catch (e) {
                              return const Text("Not Available");
                            }
                          },
                        ),
                  //     Text((() {
                  //   if (user!.displayName != null) {
                  //     return user!.displayName!;
                  //   } else {
                  //     return name;
                  //   }
                  // })()),
                ),
                Text(
                  "${user!.email}",
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 260,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 112, 107, 91),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(221, 151, 151, 151),
                              offset: Offset(6, 6),
                              blurRadius: 4),
                        ]),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Achieve more with Pro",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.auto_awesome,
                          color: Colors.yellow,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Container(
                //   // padding: const EdgeInsets.symmetric(horizontal: 20),
                //   height: 50,
                //   width: MediaQuery.of(context).size.width,
                //   margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                //   decoration: BoxDecoration(
                //     color: const Color.fromARGB(132, 70, 28, 28),
                //     borderRadius: BorderRadius.circular(20),
                //     // border:Border.all(),
                //     boxShadow:const [
                //       BoxShadow(
                //         color:Color.fromARGB(255, 214, 213, 213),
                //         offset:Offset(7,7),
                //         blurRadius : 4,
                //         // spreadRadius: 2,
                //         // blurStyle: BlurStyle.solid
                //       ) ,
                //     ]
                //   ),
                // ),
                Container(
                  padding: const EdgeInsets.only(top: 30),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 205, 197, 197),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Card(
                          elevation: 10,
                          color: const Color.fromARGB(132, 70, 28, 28),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: const Center(
                                child: Text("View Certificates",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          
                        },
                        child: Card(
                          elevation: 10,
                          color: const Color.fromARGB(132, 70, 28, 28),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: const Center(
                                child: Text("Your courses",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Card(
                          elevation: 10,
                          color: const Color.fromARGB(132, 70, 28, 28),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: const Center(
                                child: Text("Become an Instructor",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Card(
                          elevation: 10,
                          color: const Color.fromARGB(132, 70, 28, 28),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: const Center(
                                child: Text("Invite a friend",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Card(
                          elevation: 10,
                          color: const Color.fromARGB(132, 70, 28, 28),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: const Center(
                                child: Text("Frequently asked questions",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          FirebaseAuth.instance.signOut().then((value) =>
                              Navigator.pushNamed(context, "/login"));
                        },
                        child: Card(
                          elevation: 10,
                          color: const Color.fromARGB(132, 70, 28, 28),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: const Center(
                                child: Text("Sign Out",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                              )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
