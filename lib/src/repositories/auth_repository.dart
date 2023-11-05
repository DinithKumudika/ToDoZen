import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:to_do_zen/src/features/authentication/exceptions/auth_exception.dart';
import 'package:to_do_zen/src/features/authentication/screens/login/login_screen.dart';
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
      Get.offAll(() => const LoginScreen());
    }
  }

  Future<String?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      print("error:${e.code}");
      throw AuthException(e.code);
    } catch (_) {
      throw AuthException('unknown-error');
    }
  }

  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(currentUserEmail());
      print(currentUserId());
      return null;
    } on FirebaseAuthException catch (e) {
      print("error:${e.code}");
      throw AuthException(e.code);
    } catch (_) {
      throw AuthException('unknown-error');
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // create new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // return the user credential after sign in
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print("error:${e.code}");
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
      await GoogleSignIn().signOut();
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      print(e.code);
    } catch (_) {
      throw AuthException('unknown-error');
    }
  }
}
