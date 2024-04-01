import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:purity_admin/app.dart';
import 'package:purity_admin/features/authentication/controller/authentication-repository.dart';
import 'package:purity_admin/firebase_options.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  //Widget binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  ///Getx local storage
  await GetStorage.init();

  ///Await splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //Initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  runApp(const AdminApp());
}
