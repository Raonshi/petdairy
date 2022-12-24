import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:petdiary/config.dart';

class AuthProvider extends ChangeNotifier {
  bool isSignIn = false;

  AuthProvider() {
    checkAuth();
  }

  void checkAuth() async {
    await Future.delayed(const Duration(milliseconds: 300));
    FirebaseAuth.instance.idTokenChanges().listen((user) {
      if (user == null) {
        isSignIn = false;
      } else {
        isSignIn = true;
      }
    });
    notifyListeners();
  }

  Future<bool> signIn() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? account = await googleSignIn.signIn();

      if (account == null) return false;

      OAuthCredential credential = await getCredential(account);
      await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } catch (e) {
      lgr.e('ERROR: $e');
      return false;
    }
  }

  Future<OAuthCredential> getCredential(GoogleSignInAccount account) async {
    GoogleSignInAuthentication authentication = await account.authentication;
    return GoogleAuthProvider.credential(idToken: authentication.idToken, accessToken: authentication.accessToken);
  }
}
