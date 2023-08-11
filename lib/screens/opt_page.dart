import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jsdc/screens/phone_number.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    var code = "";
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Image.asset(
                  'assets/images/ph_logo.png',
                  height: 150,
                  width: 150,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Phone Verification",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                  "Let's verify your your phone number before getting started",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 35,
                ),
                Pinput(
                  length: 6,
                  onChanged: (value) {
                    code = value;
                  },
                  obscureText: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade800,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text("Verify Phone Number",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    onPressed: () async {
                      try {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: PhoneScreen.verifyId,
                                smsCode: code);
                        await FirebaseAuth.instance
                            .signInWithCredential(credential)
                            .then((value) => Navigator.pushNamedAndRemoveUntil(
                                context, "/home", (route) => false));
                      } catch (err) {
                        print('Error while verifying phone number');
                      }
                    },
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {}, child: const Text("Resend Code")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
