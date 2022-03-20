import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

Future<bool> singIn(String email, String pass) async {
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);
    print('login ok');
    return true;
  }
      catch(e){
    print(e.toString());
    return false;
      }
}
Future<bool> register(String email, String pass) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak');
    } else if (e.code == 'email-already-in-use') {
      if (kDebugMode) {
        print('The account already exists for that email');
      }
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}
