import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jsdc/screens/course_screen.dart';
import 'package:jsdc/screens/home_screen.dart';
import 'package:jsdc/screens/notification_page.dart';
import 'package:jsdc/screens/profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  int index = 0;
  List<Widget> widgetList = const [
    HomeScreen(),
    CourseScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 45, 45, 45),
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 45, 45, 45),
          foregroundColor: Colors.white,
          actions: [
            IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () async {
                  Navigator.pushNamed(context, '/notify');
                }),
          ],
          title: const Center(child: Text("IQRA")),
          elevation: 0,
        ),
        drawer: Drawer(
          // backgroundColor: const Color.fromARGB(66, 107, 107, 107),
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
        body: IndexedStack(
          index: index,
          children: widgetList,
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black26,
            unselectedItemColor: Colors.white54,
            selectedItemColor: Colors.white,
            currentIndex: index,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_rounded),
                label: "Course",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ]),
      ),
    );
  }
}
