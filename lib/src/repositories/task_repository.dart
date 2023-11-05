import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/features/tasks/models/task_model.dart';

class TaskRepository extends GetxController {
  static TaskRepository get instance => Get.find();

  final CollectionReference tasks =
      FirebaseFirestore.instance.collection('tasks');

  Future<List<TaskModel>?> getTasksByUser(String uid) async {
    try {
      QuerySnapshot qs = await tasks.where("Uid", isEqualTo: uid).get();

      List<TaskModel> taskList = [];

      for (var doc in qs.docs) {
        taskList.add(TaskModel.fromSnapshot(
            doc as DocumentSnapshot<Map<String, dynamic>>));
      }

      return taskList;
    } on FirebaseException catch (e) {
      print(e.message);
    } catch (_) {}
    return null;
  }

  Future<int?> getTaskCountByUser(String uid) async {
    try {
      AggregateQuerySnapshot qs =
          await tasks.where("Uid", isEqualTo: uid).count().get();
      return qs.count;
    } on FirebaseException catch (e) {
      print(e.message);
    } catch (_) {}
    return null;
  }

  Future<String?> add(TaskModel task) async {
    try {
      DocumentReference docRef = await tasks.add(task.toJson());

      print("new task added");
      print("task Id: ${docRef.id}");
      return docRef.id;
    } on FirebaseException catch (e) {
      print(e);
    } catch (_) {}

    return null;
  }

  Future<List<TaskModel>?> getCompleted() async {
    List<TaskModel> completedTasks = [];
    try {
      QuerySnapshot qs =
          await tasks.where("Status", isEqualTo: "Completed").get();
      for (DocumentSnapshot taskDoc in qs.docs) {
        completedTasks.add(TaskModel.fromSnapshot(
            taskDoc as DocumentSnapshot<Map<String, dynamic>>));
      }
      return completedTasks;
    } catch (e) {}
    return null;
  }

  Future<List<TaskModel>?> getPending() async {
    List<TaskModel> pendingTasks = [];
    try {
      QuerySnapshot qs =
          await tasks.where("Status", isEqualTo: "Pending").get();
      for (DocumentSnapshot taskDoc in qs.docs) {
        pendingTasks.add(TaskModel.fromSnapshot(
            taskDoc as DocumentSnapshot<Map<String, dynamic>>));
      }
      return pendingTasks;
    } catch (e) {}
    return null;
  }
}
