import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:petdiary/config.dart';

class AuthProvider extends ChangeNotifier {
  bool isSignIn = false;

  AuthProvider(BuildContext context) {
    _checkAuth(context);
  }

  void _checkAuth(BuildContext context) {
    FirebaseAuth.instance.idTokenChanges().listen((user) {
      if (user == null) {
        isSignIn = false;
      } else {
        isSignIn = true;
        context.go('/');
      }
    });

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      isSignIn = true;
    }
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
