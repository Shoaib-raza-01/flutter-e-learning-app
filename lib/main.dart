import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jsdc/components/category_widget.dart';
import 'package:jsdc/screens/dashboard.dart';
import 'package:jsdc/screens/login_page.dart';
import 'package:jsdc/screens/notification_page.dart';
import 'package:jsdc/screens/opt_page.dart';
import 'package:jsdc/screens/phone_number.dart';
import 'package:jsdc/screens/resister_page.dart';
import 'package:jsdc/utils/google_files.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) =>ChangeNotifierProvider(
    create: (context) =>  GoogleAuthClass(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData
      (
        primarySwatch: Colors.blue,
      ),
      home: FirebaseAuth.instance.currentUser != null ? const HomePage() : const LoginPage(),
      // initialRoute: "/login",
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/phone' : (context) => const PhoneScreen(),
        '/otp' : (context) => const OTPScreen(),
        '/notify' :(context)=> const NotificationScreen(),
      },
    ),
    );
  
}

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(seconds: 2), () {
//       Navigator.of(context).pushReplacementNamed('/login');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//           width: double.infinity,
//           color: Colors.white,
//           child: Column(
//             children: const [
//               SizedBox(
//                 height: 200,
//               ),
//               FlutterLogo(
//                 size: 300,
//               ),
//               SizedBox(
//                 height: 200,
//               ),
//               CircularProgressIndicator()
//             ],
//           )),
//     );
//   }
// }
