import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  bool _showPassword = false;

  void _toggleVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                    obscureText: !_showPassword,
                  ),
                ),
                ElevatedButton(
                    child: const Text("Log In"),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    })
              ]),
            ),

            // google and number login feature
            SizedBox(
              height: 150,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 0, 0, 0)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              "https://www.telefonkonferenz.de/blog/wp-content/uploads/2017/08/google-app-logo.png",
                              height: 35,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Login Using Google",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 0, 0, 0)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              "https://cdn1.iconfinder.com/data/icons/smartphone-signal-5g-trading/64/Smartphone_Verification_001-512.png",
                              height: 35,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Continue With Number",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            //text to register a user
            SizedBox(
              // color: Colors.amber,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "Don't have an account?",
                      style: TextStyle(color: Colors.black54)),
                  TextSpan(
                      text: "    Register",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13))
                ])),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
