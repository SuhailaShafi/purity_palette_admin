import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:purity_admin/admin_home.dart';
import 'package:purity_admin/features/authentication/controller/authentication-repository.dart';
import 'package:purity_admin/utils/internet/network_manager.dart';
import 'package:purity_admin/utils/popup/full_screen_loader.dart';
import 'package:purity_admin/utils/popup/loaders.dart';

class loginController extends GetxController {
  //variables
  final rememberMe = false.obs;
  final hidepassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginformkey = GlobalKey<FormState>();
  Future<void> emailAndPasswordSignIn() async {
    try {
      //start loading
      SFullScreenLoader.openLoadingDialog(
          'Logging you in ..', 'assets/animation_loading.json');
      //check internet connectivity
      final isConnected = await Networkmanager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoaduing();
        print('not connected..............');
        return;
      }

      //form validation
      if (!loginformkey.currentState!.validate()) {
        SFullScreenLoader.stopLoaduing();

        return;
      }
      print('validated');
      //Save Data if remenber me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //login user using email and password
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      //Remove loader
      SFullScreenLoader.stopLoaduing();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      SFullScreenLoader.stopLoaduing();
      SLoaders.errorSnackBar(title: 'oh snap', message: e.toString());
    }
  }
}
