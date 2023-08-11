import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 96, 89, 67),
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          actions: [
            IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () async {
                  Navigator.pushNamed(context,'/notify');
                }),
          ],
          title: const Center( 
            child: Text("IQRA")
          ),
          elevation: 0,
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.green,
                ), //BoxDecoration
                child: UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(color: Colors.green),
                  accountName: user!.displayName != null
                      ? Text("${user!.displayName}")
                      : StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("user")
                              .doc(user!.uid)
                              .snapshots(),
                          builder: (context, snapshot) {
                            return Text("${snapshot.data?['name']}");
                          },
                        ),
                  accountEmail: Text("${user!.email}"),
                  currentAccountPictureSize: const Size.square(50),
                  currentAccountPicture: const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 165, 255, 137),
                    child: Text(
                      "A",
                      style: TextStyle(fontSize: 30.0, color: Colors.blue),
                    ), //Text
                  ), //circleAvatar
                ), //UserAccountDrawerHeader
              ), //DrawerHeader
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(' My Profile '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.book),
                title: const Text(' My Course '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.workspace_premium),
                title: const Text(' Go Premium '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.video_label),
                title: const Text(' Saved Videos '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text(' Edit Profile '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () {
                  // Navigator.pop(context);
                  FirebaseAuth.instance
                      .signOut()
                      .then((value) => Navigator.pushNamed(context, "/login"));
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // banner
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.black12,
              ),
              //sub category text
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.yellowAccent.shade100,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sub categories",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        //sub category list
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const <Widget>[
                                SizedBox(
                                  height: 40,
                                  child: Card(
                                    child: Center(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 14, right: 14),
                                      child: Text("Core Java(1)"),
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  child: Card(
                                    child: Center(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 14, right: 14),
                                      child: Text("Advanced Java(2)"),
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  child: Card(
                                    child: Center(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 14, right: 14),
                                      child: Text("Micro Services(1)"),
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  child: Card(
                                    child: Center(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 14, right: 14),
                                      child: Text("Spring Boot(1)"),
                                    )),
                                  ),
                                ),
                              ]),
                        ),
                      ]),
                ),
              ),

              // popular courses text and card.
              Container(
                height: 600,
                width: double.infinity,
                color: const Color.fromARGB(255, 222, 222, 222),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Popular Courses",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),

                        //card

                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            height: 480,
                            width: 330,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15))),
                                    width: 350,
                                    height: 200,
                                    child: Image.asset(
                                      'assets/images/loginScreen.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const <Widget>[
                                          SizedBox(
                                            height: 25,
                                            child: Card(
                                              child: Center(
                                                  child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 14, right: 14),
                                                child: Text(
                                                  "LIVE CLASS",
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                              )),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25,
                                            child: Card(
                                              child: Center(
                                                  child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 14, right: 14),
                                                child: Text(
                                                  "FREE CONTENT",
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                              )),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25,
                                            child: Card(
                                              child: Center(
                                                  child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 14, right: 14),
                                                child: Text(
                                                  "FILES",
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                              )),
                                            ),
                                          ),
                                        ]),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 20.0, top: 10),
                                    child: Text(
                                      "Complete Core Java",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20, top: 70),
                                    child: Text(
                                      "Rs 200",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                      color: const Color.fromARGB(
                                          255, 213, 213, 213),
                                      height: 1,
                                    ),
                                  ),
                                  Center(
                                    child: SizedBox(
                                      height: 30,
                                      width: 250,
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          child: const Text("Get This Course")),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),

              //share tour experience
              Container(
                color: Colors.brown.shade100,
                height: 200,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
