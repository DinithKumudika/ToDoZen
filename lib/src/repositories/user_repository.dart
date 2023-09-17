import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    var users = await _db.collection('users').add(user.toJson());
  }

  getUsers() async {}

  Future<UserModel?> findUserById(String id) async {
    try {
      final docRef = await _db.collection('users').doc(id);
      final snapshot = await docRef.get();
      final data = UserModel.fromSnapshot(snapshot);
      return data;
    } on FirebaseException catch (e) {
      print(e.message);
    }
    return null;
  }
}
