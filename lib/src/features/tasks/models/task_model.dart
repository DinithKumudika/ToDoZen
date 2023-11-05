import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String? id;
  final String uid;
  final String title;
  final String priority;
  final String label;
  final String description;
  final String status;
  final Timestamp startDate;
  final Timestamp endDate;

  TaskModel({
    this.id,
    required this.uid,
    required this.title,
    required this.priority,
    required this.description,
    required this.label,
    required this.status,
    required this.startDate,
    required this.endDate,
  });

  toJson() {
    return {
      "Uid": uid,
      "Title": title,
      "Description": description,
      "Priority": priority,
      "Label": label,
      "Status": status,
      "StartAt": startDate,
      "EndAt": endDate,
    };
  }

  factory TaskModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final Map<String, dynamic>? data = document.data();

    return TaskModel(
        id: document.id,
        uid: data!['Uid'],
        title: data['Title'],
        priority: data['Priority'],
        label: data['Label'],
        status: data['Status'],
        description: data['Description'],
        startDate: data['StartAt'],
        endDate: data['EndAt']);
  }
}