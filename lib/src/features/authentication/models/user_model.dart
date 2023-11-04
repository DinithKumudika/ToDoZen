import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNo;

  const UserModel(
      {this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.phoneNo});

  Map<String, Object?> toJson() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "Email": email,
      "Phone": phoneNo,
    };
  }

  // Mapping user data from Firebase to UserModel
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final Map<String, dynamic>? data = document.data();

    return UserModel(
      id: document.id,
      email: data!["Email"] as String,
      firstName: data["FirstName"] as String,
      lastName: data["LastName"] as String,
      phoneNo: data["PhoneNo"] as String,
    );
  }
}
