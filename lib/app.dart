import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purity_admin/bindings/general_bindings.dart';
import 'package:purity_admin/features/authentication/screens/login/login.dart';
import 'package:purity_admin/utils/theme/theme.dart';

class AdminApp extends StatelessWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: AdminLogin(),
      themeMode: ThemeMode.system,
      theme: SAppTheme.lightTheme,
      darkTheme: SAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
    );
  }
}
