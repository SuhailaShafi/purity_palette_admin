import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:purity_admin/admin_home.dart';
import 'package:purity_admin/features/authentication/screens/login/login.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

//variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

//called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

//function to show relevant screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      Get.offAll(() => AdminHome());
    } else {
      //local storage

      Get.offAll(() => const AdminLogin());
    }
  }

//[Email authentication ]--SignIn
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e;
    } on FirebaseException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }

//[Logout User]-Valid for any authentication
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const AdminLogin());
    } on FirebaseAuthException catch (e) {
      throw e;
    } on FirebaseException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
//[Delete User] Remove user auth and firestore account
}
