import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthClass extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _account;
  GoogleSignInAccount get account => _account!;

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      // Obtain the auth details from the request
      final googleAuth = await googleUser.authentication;
      // Create a new credential object with the token data and sign it using SHA-256
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (err) {
      print("Error in login $err");
    }
    notifyListeners();
  }

  Future signOutUser() async {
    await googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
  }
}
