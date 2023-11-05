import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<String?> createUser(String uid, UserModel user) async {
    try {
      await users.doc(uid).set(user.toJson());
      print("user added");
    } on FirebaseException catch (e) {
      print(e.message);
    } catch (_) {}
    return null;
  }

  getUsers() async {}

  Future<UserModel?> findUserById(String id) async {
    try {
      final DocumentReference document = users.doc(id);
      final snapshot =
          await document.get() as DocumentSnapshot<Map<String, dynamic>>;
      if (snapshot.exists) {
        final data = UserModel.fromSnapshot(snapshot);
        return data;
      }
    } on FirebaseException catch (e) {
      print(e.message);
    }
    return null;
  }
}
