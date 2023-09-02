import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jsdc/components/course_card.dart';

import '../components/category_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            children: <Widget>[
                              SizedBox(
                                height: 40,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CategoryScreen(
                                                    text: "core Java")));
                                  },
                                  child: const Card(
                                    child: Center(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 14, right: 14),
                                      child: Text("Core Java(1)"),
                                    )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CategoryScreen(
                                                    text: "Advanced Java")));
                                  },
                                  child: const Card(
                                    child: Center(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 14, right: 14),
                                      child: Text("Advanced Java(2)"),
                                    )),
                                  ),
                                ),
                              ),
                              const SizedBox(
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
                              const SizedBox(
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
            const SizedBox(
              height: 500,
              width: double.infinity,
              child:  Padding(
                padding: EdgeInsets.only(left: 15, top: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Popular Courses",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),

                      //card
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CourseCard(
                              title: 'Complete Core Java',
                              price: 200,
                              courseRef: '/core-java',
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CourseCard(
                              title: 'Python Programming',
                              price: 250,
                              courseRef: '/Python',
                              img: "",
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
            ),

            //share tour experience
            SizedBox(
              height: 170,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: (MediaQuery.of(context).size.width / 2) - 10,
                      height: 170,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              "Share Your Experience",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              "Give your tutor a smile by sharing your experience",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    elevation: 10,
                                    backgroundColor: const Color.fromARGB(
                                        255, 215, 215, 215),
                                    foregroundColor: Colors.black),
                                child: const Text("Write Now")),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width / 2) - 10,
                    height: 170,
                    child: Image.asset('assets/images/rating.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
