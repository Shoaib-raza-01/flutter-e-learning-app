import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jsdc/utils/google_files.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _showPassword = false;

  void _toggleVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.blue.withOpacity(0.7),
                  Colors.purple.shade50.withOpacity(0.3)
                ], begin: const Alignment(-1, -1), end: const Alignment(1, 1)),
              ),
              child: const Image(
                  image: AssetImage('assets/images/google_logo.png')),
            ),
            //appname and descr
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              height: 50,
              child: Text(
                "Java 7 Days Challenge",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            //carousel auto slide
            CarouselSlider(
              items: [
                SizedBox(
                  height: 60,
                  child: Card(
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: const Color.fromARGB(255, 216, 223, 229),
                    shadowColor: Colors.black87,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Text(
                            '''“Live as if you were to die tomorrow. Learn as if you were to live forever.”''',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text("-- Mahatma Gandhi"),
                              )),
                        ],
                      ),
                    )),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: Card(
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: const Color.fromARGB(255, 216, 223, 229),
                    shadowColor: Colors.black87,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Text(
                            '''“The past has no power over the present moment.”''',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text("-- Eckhart Tolle"),
                              )),
                        ],
                      ),
                    )),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: Card(
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: const Color.fromARGB(255, 216, 223, 229),
                    shadowColor: Colors.black87,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Text(
                            '''“The mind is not a vessel to be filled, but a fire to be kindled.”''',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text("-- Plutarch"),
                              )),
                        ],
                      ),
                    )),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: Card(
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: const Color.fromARGB(255, 216, 223, 229),
                    shadowColor: Colors.black87,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Text(
                            '''“It does not matter how slowly you go as long as you do not stop.”''',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text("-- Confucius"),
                              )),
                        ],
                      ),
                    )),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 85.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),

            //form to login
            Form(
              key: _loginFormKey,
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 40, left: 10, right: 10, bottom: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "Enter Your Email",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) 'Email is required';
                      return null;
                    },
                    controller: emailController,
                    obscureText: false,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _toggleVisibility();
                        },
                        child: Icon(
                          _showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "Enter Password",
                    ),
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    obscureText: !_showPassword,
                  ),
                ),
                ElevatedButton(
                    child: const Text("Log In"),
                    onPressed: () {
                      try {
                        if (emailController.text == "" ||
                            passwordController.text == "") {
                          print("fill");
                        }
                        FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim()
                        ).then((value) => Navigator.of(context).pushNamed("/home"));
                      } catch (err) {
                        print('Error in Login $err}');
                      }
                    })
              ]),
            ),

            // google and number login feature
            SizedBox(
              height: 150,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      final provider =
                          Provider.of<GoogleAuthClass>(context, listen: false);
                      provider.googleLogin().then((value) {
                        Navigator.pushNamed(context, '/home');
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 87, 199, 233)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Image(
                                image:
                                    AssetImage('assets/images/google_logo.png'),
                                height: 30,
                                width: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Login Using Google",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/phone');
                    },
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 87, 199, 233)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Image(
                                image: AssetImage(
                                  'assets/images/ph_logo.png',
                                ),
                                height: 30,
                                width: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Continue With Number",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            //text to register a user
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.black54),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text(
                      " Register ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  )
                ],
              ),
            ),
            // SizedBox(
            //   // color: Colors.amber,
            //   child: InkWell(
            //     onTap: () {
            //       Navigator.pushNamed(context, '/register');
            //     },
            //     child: const Text.rich(TextSpan(children: [
            //       TextSpan(
            //           text: "Don't have an account?",
            //           style: TextStyle(color: Colors.black54)),
            //       TextSpan(
            //           text: "    Register",
            //           style:
            //               TextStyle(fontWeight: FontWeight.bold, fontSize: 13))
            //     ])),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // void signInAnonymously() async {
  //   try {
  //     final anonymousUser = await FirebaseAuth.instance.signInAnonymously();
  //     print(anonymousUser.user!.uid);
  //   } catch (e) {
  //     print("Error signing in anonymously ${e.toString()}");
  //   }
  // }
}
