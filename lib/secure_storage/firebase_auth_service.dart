import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mami_onesignal_flutter/secure_storage/auth_base.dart';
import 'package:mami_onesignal_flutter/secure_storage/user_model.dart';

class FirebaseAuthService implements AuthBase {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  UserModel? _userFromFirebase(User user) {
    return UserModel(
      userId: user.uid,
      email: user.email.toString(),
    );
  }

  @override
  Future<UserModel?> googleWithSingIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential =
            await firebaseAuth.signInWithCredential(credential);
        final User? user = userCredential.user;
        if (user != null) {
          const storage = FlutterSecureStorage();
          await storage.write(
              key: "credential", value: userCredential.toString());
          return _userFromFirebase(user);
        }
      }
      return null;
    } catch (e) {
      debugPrint('Google ile giriş yaparken hata oluştu: $e');
      return null;
    }
  }

  @override
  Future<bool> singOut() async {
    try {
      final googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      await firebaseAuth.signOut();
      return true;
    } catch (e) {
      debugPrint("hataaa signOut$e");
      return false;
    }
  }
}
