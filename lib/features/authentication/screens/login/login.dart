import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:purity_admin/features/authentication/screens/login/widgets/login_form.dart';
import 'package:purity_admin/features/authentication/screens/login/widgets/login_header.dart';
import 'package:purity_admin/styles/spacing_styles.dart';
import 'package:purity_admin/utils/constants/sizes.dart';
import 'package:purity_admin/utils/helpers/helper_function.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //Logo title and Subtitle
              LoginHeaderWidget(dark: dark),

              //Form
              const LoginFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
