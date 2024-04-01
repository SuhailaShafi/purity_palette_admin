import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:purity_admin/utils/helpers/helper_function.dart';
import 'package:purity_admin/utils/popup/animation_loader.dart';

class SFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Container(
          color: SHelperFunction.isDarkMode(Get.context!)
              ? Colors.black
              : Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 250,
                ),
                SAnimationLoaderWidget(text: text, animation: animation)
              ],
            ),
          ),
        ),
      ),
    ); /* showDialog(
      context: Get.overlayContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
          content: Image(image: AssetImage(animation)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );*/
    /*showDialog(
      context: Get.overlayContext!,
      builder: (BuildContext context) {
        // Delay for demonstration purpose
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop(); // Close the dialog
          // Navigate to the next page after the delay
          Get.off();
        });

        return AlertDialog(
          title: Text(text),
          content: Image(image: AssetImage(animation)),
        );
      },
    );*/
  }

  static stopLoaduing() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
