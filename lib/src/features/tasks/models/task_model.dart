import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String? id;
  final String uid;
  final String title;
  final String description;
  final Timestamp dueAt;

  TaskModel({
    this.id,
    required this.uid,
    required this.title,
    required this.description,
    required this.dueAt,
  });

  toJson() {
    return {
      "Uid": uid,
      "title": title,
      "description": description,
      "dueAt": dueAt,
    };
  }

  factory TaskModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final Map<String, dynamic>? data = document.data();

    return TaskModel(
        id: document.id,
        uid: data!['Uid'],
        title: data['Title'],
        description: data['Description'],
        dueAt: data['DueAt']);
  }
}
