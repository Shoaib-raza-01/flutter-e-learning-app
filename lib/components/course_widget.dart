import 'package:flutter/material.dart';

class BuyCoursePage extends StatefulWidget {
  const BuyCoursePage({super.key});

  @override
  State<BuyCoursePage> createState() => _BuyCoursePageState();
}

class _BuyCoursePageState extends State<BuyCoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xff293146),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Complete Core Java",
          textAlign: TextAlign.left, 
          style: TextStyle(
            color: Colors.black
          )
        ),
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
        // height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 160,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
//advertize here
                    Container(
                          color: Colors.black,
                          height: 200,
                    ),
                    SizedBox(
                      height: 530,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "About This Course",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Learn complete core Java from beginning. \nNo prior knowledge of any prgramming language is required for this course. This course is suitable for any technical or non technical person to start their career in IT industry as java developer",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                wordSpacing: 1.5,
                                letterSpacing: .4,
                              ),
                            ),
                          
                            //validity and learning
                            const SizedBox(
                              height: 20,
                            ),
                            const SizedBox(
                              // color: Colors.blue.shade100,
                              height: 150,
                              width: double.infinity,
                              child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 70,
                                      width: double.infinity,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Icon(
                                                Icons.watch_later,
                                                size: 40,
                                              ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                  Text("Lifetime validity",
                                                      style: TextStyle(
                                                        fontSize: 19,
                                                        fontWeight: FontWeight.bold),
                                                  ),  
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text("You can access this course throughout your lifespan",
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontStyle: FontStyle.italic,
                                                        color: Colors.black54),
                                                      ),
                                                ]
                                              ),
                                            )
                                          ]),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 70,
                                      width: double.infinity,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Icon(
                                                Icons.play_circle,
                                                size: 40,
                                              ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  
                                                  Text("13 pdf files",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontWeight: FontWeight.bold),),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text("13 Detailed Learning Materials",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontStyle: FontStyle.italic,
                                                        color: Colors.black54),),
                                                ],
                                              ),
                                            )
                                          ]),
                                    ),
                                  ]),
                            ),
                            // extra features
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(233, 244, 183, 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text("What else you will get?",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsets.only(left:10.0,right: 10,bottom: 10),
                                    child: Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 150,
                                            width: 170,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.local_play_rounded,
                                                      size: 30,
                                                    ),
                                                    SizedBox(width: 10,),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Live Classes",
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 16
                                                              ),
                                                            ), 
                                                            SizedBox(height: 5),
                                                            Text("Interactive video lessons",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors.black54,
                                                                fontStyle: FontStyle.italic
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                      
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.laptop_mac_rounded,
                                                      size: 30,
                                                    ),
                                                    SizedBox(width: 10,),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Available on PC",
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 16
                                                              ),
                                                            ), 
                                                            SizedBox(height: 5),
                                                            Text("Bigger screen better clearity",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors.black54,
                                                                fontStyle: FontStyle.italic
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                      
                                                    )
                                                  ],
                                                ),
                                                ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 150,
                                            width: 170,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.download_for_offline_rounded,
                                                      size: 30,
                                                    ),
                                                    SizedBox(width: 10,),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Offline Downloads",
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 15
                                                              ),
                                                            ), 
                                                            SizedBox(height: 5),
                                                            Text("Learn at your own convenience",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors.black54,
                                                                fontStyle: FontStyle.italic
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                      
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.insert_drive_file_rounded,
                                                      size: 30,
                                                    ),
                                                    SizedBox(width: 10,),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Certificate",
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 16
                                                              ),
                                                            ), 
                                                            SizedBox(height: 5),
                                                            Text("Get a certificate on course completion",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors.black54,
                                                                fontStyle: FontStyle.italic
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                      
                                                    )
                                                  ],
                                                ),
                                                ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      height: 200,
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 80,
                color: const Color.fromARGB(255, 3, 20, 34),
                child: Row(children: [
                  const Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: 20,
                      ),
                      child: Text(
                        "Price",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 2, 57, 167))),
                          onPressed: () {},
                          child: const Text(
                            "Buy Now",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}