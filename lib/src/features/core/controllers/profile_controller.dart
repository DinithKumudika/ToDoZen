import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/features/authentication/models/user_model.dart';
import 'package:to_do_zen/src/repositories/auth_repository.dart';
import 'package:to_do_zen/src/repositories/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthRepository());
  final _userRepo = Get.put(UserRepository());

  String? currentUid(){
    final currentUser = _authRepo.firebaseUser.value;
    return currentUser!.uid;
  }

  Future<UserModel?> currentUserData() async {
    final currentUser = _authRepo.firebaseUser.value;
    print("current user $currentUser");
    if (currentUser!.displayName == null) {
      try {
        final UserModel? user =
            await _userRepo.findUserById(currentUser.uid);
        print("logged in as $user");
        return user;
      } on FirebaseException catch (e) {
        print(e.message);
      }
    } else {
      // users from google auth
    }
    return null;
  }
}
