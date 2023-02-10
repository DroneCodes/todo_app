import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String username;
  final String email;
 const UserModel({
   required this.username,
   required this.email,
 });

  Map<String, dynamic> toJson() => {
    "username": username,
    "email": email,
  };

  static UserModel fromSnap(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;

    return UserModel(username: snapshot["username"], email: snapshot["email"]);
  }
}