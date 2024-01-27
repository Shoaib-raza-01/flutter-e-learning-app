import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:jsdc/components/custom_alert_dialog.dart';
import 'package:jsdc/utils/keys.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class BuyCoursePage extends StatefulWidget {
  final String storageRef;
  final String appbar;
  const BuyCoursePage(
      {super.key, required this.storageRef, required this.appbar});

  @override
  State<BuyCoursePage> createState() => _BuyCoursePageState();
}

class _BuyCoursePageState extends State<BuyCoursePage> {
  late Future<ListResult> coreJavaFiles;

  late bool haveBuyed;
  @override
  void initState() {
    super.initState();
    haveBuyed = false;
    coreJavaFiles = FirebaseStorage.instance.ref(widget.storageRef).listAll();
  }

  Future _downloadFile(Reference ref) async {
    try {
      // final dir = await getExternalStorageDirectory();
      // final file = File('${dir!.path}/${ref.name}');
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/${ref.name}');
      await ref.writeToFile(file);
      OpenFile.open('$file');
      //  OpenFile.open('${dir.path}/${ref.name}');

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Downloading......")));
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

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
          title: Text(widget.appbar,
              textAlign: TextAlign.left, style: TextStyle(color: Colors.black)),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 9,
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 160,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10, bottom: 10),
                        child: Text(
                          "Downloadable Contents",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      FutureBuilder(
                          future: coreJavaFiles,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final files = snapshot.data?.items;
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: SizedBox(
                                  height: 120,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: files?.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        final file = files?[index];
                                        return SizedBox(
                                          height: 100,
                                          width: 150,
                                          child: InkWell(
                                            onTap: () {
                                              _downloadFile(file);
                                            },
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                      flex: 7,
                                                      child: Center(
                                                          child: Image.asset(
                                                              'assets/images/pdf_image.png'))),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 5,
                                                                right: 5),
                                                        child: Text(
                                                          file!.name,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return const Center(
                                child: Text(
                                    "unable to load!!\nCheck your connection"),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
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
                              StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection("courseContent")
                                      .doc(widget.storageRef)
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    try {
                                      DocumentSnapshot docSnap = snapshot.data!;
                                      return Text(
                                        docSnap['about'],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 5,
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 15,
                                          wordSpacing: 1.5,
                                          letterSpacing: .4,
                                        ),
                                      );
                                    } catch (e) {
                                      return AlertDialog(
                                        title: const Text('AlertDialog Title'),
                                        content: const SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              Text(
                                                  'This is a demo alert dialog.'),
                                              Text(
                                                  'Would you like to approve of this message?'),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Approve'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    }
                                  }),

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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Lifetime validity",
                                                        style: TextStyle(
                                                            fontSize: 19,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "You can access this course throughout your lifespan",
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                    ]),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Pdf files",
                                                      style: TextStyle(
                                                          fontSize: 19,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "Detailed Learning Materials",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          color:
                                                              Colors.black54),
                                                    ),
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
                                    color:
                                        const Color.fromRGBO(233, 244, 183, 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        "What else you will get?",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.0, right: 10, bottom: 10),
                                      child: Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: 150,
                                              width: 170,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .local_play_rounded,
                                                        size: 30,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Live Classes",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 16),
                                                            ),
                                                            SizedBox(height: 5),
                                                            Text(
                                                              "Interactive video lessons",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black54,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .laptop_mac_rounded,
                                                        size: 30,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Available on PC",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 16),
                                                            ),
                                                            SizedBox(height: 5),
                                                            Text(
                                                              "Bigger screen better clearity",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black54,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic),
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .download_for_offline_rounded,
                                                        size: 30,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Offline Downloads",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 15),
                                                            ),
                                                            SizedBox(height: 5),
                                                            Text(
                                                              "Learn at your own convenience",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black54,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .insert_drive_file_rounded,
                                                        size: 30,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Certificate",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 16),
                                                            ),
                                                            SizedBox(height: 5),
                                                            Text(
                                                              "Get a certificate on course completion",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black54,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic),
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
                      Flexible(
                        fit: FlexFit.loose,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.only(left: 15, bottom: 10),
                                child: Text(
                                  "Access free content",
                                  textAlign: TextAlign.center,
                                  // textScaleFactor: 2,
                                  maxLines: null,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 10, 32, 34)),
                                ),
                              ),
                              // Padding(
                              //list all the contents of a field in firebase firestore
                              //   padding: const EdgeInsets.only(
                              //       left: 20.0, bottom: 10),
                              //   child: StreamBuilder(
                              //     stream: FirebaseFirestore.instance
                              //         .collection("courseContent")
                              //         .doc("core_java")
                              //         .snapshots(),
                              //     builder: (context, snapshot) {
                              //       //great achievement
                              //       final content = snapshot.data?.data();
                              //       List<String> topic = [];
                              //       content?.forEach((key, value) {
                              //         topic.add(value);
                              //       });
                              //       List<Widget> lessonWidget = topic
                              //           .map((lesson) => Text(lesson,
                              //               style: const TextStyle(
                              //                   fontSize: 17,
                              //                   fontWeight: FontWeight.bold)))
                              //           .toList();
                              //       return Column(
                              //         crossAxisAlignment:
                              //             CrossAxisAlignment.start,
                              //         children: lessonWidget,
                              //       );
                              //     },
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, bottom: 10),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    // border: Border.all(),
                                    gradient: LinearGradient(colors: [
                                      const Color.fromRGBO(255, 3, 0, 0)
                                          .withOpacity(0.3),
                                      const Color.fromRGBO(233, 244, 183, 1)
                                          .withOpacity(0.7),
                                    ]),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 15, bottom: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Facing any difficulty",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushNamed("/chat");
                                          },
                                          child: const Text(
                                            "Ask here",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 38, 38, 38)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  width: double.infinity,
                  height: 80,
                  color: const Color.fromARGB(255, 3, 20, 34),
                  child: (haveBuyed == false)
                      ? Row(children: [
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
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color.fromARGB(
                                                  255, 2, 57, 167))),
                                  onPressed: () {
                                    Razorpay razorpay = Razorpay();
                                    var options = {
                                      'key': APIKey.razorpayApiKey,
                                      'amount': 205 * 100,
                                      'name': 'Acme Corp.',
                                      'description': 'Fine T-Shirt',
                                      'retry': {
                                        'enabled': true,
                                        'max_count': 1
                                      },
                                      'send_sms_hash': true,
                                      'prefill': {
                                        'contact': '7209602458',
                                        'email': 'test@razorpay.com'
                                      },
                                      // 'external': {
                                      //   'wallets': ['paytm','gpay','phonePe]
                                      // }
                                    };
                                    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                                        handlePaymentErrorResponse);
                                    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                                        handlePaymentSuccessResponse);
                                    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                                        handleExternalWalletSelected);
                                    razorpay.open(options);
                                  },
                                  child: const Text(
                                    "Buy Now",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ])
                      : Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color.fromARGB(255, 69, 94, 217)),
                          child: Center(
                            child: Text("Go to course"),
                          ),
                        )),
            ),
          ],
        ));
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    showDialog(
      barrierColor: Colors.black38,
      context: context,
      builder: (context) {
        return CustomAlertDialog(
            title: "Payment Failed",
            description:
                "Code: ${response.code}\nDescription: ${response.message}");
      },
    );
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    showDialog(
      barrierColor: Colors.black38,
      context: context,
      builder: (context) {
        return CustomAlertDialog(
            title: "Payment Success",
            description:
                "Code: ${response.orderId}\nDescription: ${response.paymentId}\nSignature : ${response.signature}");
      },
    );
    setState(() {
      haveBuyed = true;
    });
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showDialog(
      barrierColor: Colors.black38,
      context: context,
      builder: (context) {
        return CustomAlertDialog(
            title: "Wallet used",
            description: "Wallet Used : ${response.walletName}");
      },
    );
  }
}
