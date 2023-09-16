import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/features/authentication/exceptions/auth_exception.dart';
import 'package:to_do_zen/src/screens/welcome_screen.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const WelcomeScreen());
    }
  }

  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    String? message;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(currentUserEmail());
      print(currentUserId());
      return null;
    } on FirebaseAuthException catch (e) {
      // switch (e.code) {
      //   case 'user-not-found':
      //     message = 'No user exists for that email';
      //     break;
      //   case 'wrong-password':
      //     message = 'Invalid password';
      //     break;
      //   default:
      //     message = 'Unknown error occurred';
      //     break;
      // }
      print("error:" + e.code);
      throw AuthException(e.code);
    } catch (_) {
      throw AuthException('unknown-error');
    }
  }

  String? currentUserId() {
    return firebaseUser.value?.uid;
  }

  String? currentUserEmail() {
    return firebaseUser.value?.email;
  }

  Future<void> logoutUser() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }
}
