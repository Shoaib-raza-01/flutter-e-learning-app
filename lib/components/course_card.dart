import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jsdc/components/course_widget.dart';

class CourseCard extends StatelessWidget {
  final String? img;
  final String title;
  final int price;
  final String courseRef;

  const CourseCard(
      {super.key,
      this.img,
      required this.title,
      required this.price,
      required this.courseRef});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        // height: 480,
        // color: Colors.black12,
        width: 285,
        child: Card(
          color: Color.fromARGB(255, 207, 206, 202),
          // elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('courseContent')
                        .doc(courseRef)
                        .snapshots(),
                    builder: (context, snapshot) {
                      try{
                        var docSnap = snapshot.data;
                        return Image.network(
                        docSnap!['img'],
                      );
                      }catch(e){
                        return const CircularProgressIndicator();
                      }
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(colors: [
                              const Color.fromARGB(179, 221, 34, 231)
                                  .withOpacity(0.3),
                              const Color.fromARGB(255, 180, 132, 204)
                                  .withOpacity(0.7),
                            ])),
                        child: const Center(
                            child: Padding(
                          padding: EdgeInsets.only(left: 14, right: 14),
                          child: Text(
                            "LIVE CLASS",
                            style: TextStyle(fontSize: 10),
                          ),
                        )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(colors: [
                              const Color.fromARGB(179, 221, 34, 231)
                                  .withOpacity(0.3),
                              const Color.fromARGB(255, 180, 132, 204)
                                  .withOpacity(0.7),
                            ])),
                        child: const Center(
                            child: Padding(
                          padding: EdgeInsets.only(left: 14, right: 14),
                          child: Text(
                            "FREE CONTENT",
                            style: TextStyle(fontSize: 10),
                          ),
                        )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(colors: [
                              const Color.fromARGB(179, 221, 34, 231)
                                  .withOpacity(0.3),
                              const Color.fromARGB(255, 180, 132, 204)
                                  .withOpacity(0.7),
                            ])),
                        child: const Center(
                            child: Padding(
                          padding: EdgeInsets.only(left: 14, right: 14),
                          child: Text(
                            "FILES",
                            style: TextStyle(fontSize: 10),
                          ),
                        )),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 30),
                child: Text(
                  "Rs ${price.toString()}",
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 40, right: 40, bottom: 20),
                child: SizedBox(
                  height: 40,
                  width: 280,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(179, 255, 179, 254)
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BuyCoursePage(
                                    storageRef: courseRef, appbar: title)));
                      },
                      child: const Text("Get This Course",style: TextStyle(color: Colors.black),)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
