import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/models/user_model.dart';

class Authentication {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "some error occurred";
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password,);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        res = "No User Found for this email";
      } else if (e.code == "wrong-password") {
        res = "The Password entered is incorrect";
      }
    }
    catch (e) {
      res = e.toString();
    }
    return res;
  }


  Future<String> registerUser({
    required String email,
    required String password,
    required String username,
    //required Uint8List file,
  }) async{
    String res = "Some Error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty) {
        final credential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password,);

        //TODO: add a flutterFire code to create a collection

        UserModel userModel = UserModel(username: username, email: email);

        await firebaseFirestore.collection("users").doc(credential.user!.uid).set(userModel.toJson());

        res = "success";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        res = "The email is badly formatted.";
      } else if (e.code == "email-already-in-use") {
        res = "The account already exists for that email";
      } else if (e.code == "weak-password") {
        res = "The password provided is too weak";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}



