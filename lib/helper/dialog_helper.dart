import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  /// show dialog
  static void showErrorDialog(
      {String title = 'Error', String description = 'Something went wrong'}) {
    Get.dialog(Dialog(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Get.textTheme.headline4,
          ),
          Text(
            description,
            style: Get.textTheme.headline6,
          ),
          ElevatedButton(
              onPressed: () {
                if (Get.isDialogOpen!) Get.back();
              },
              child: Text('Okay'))
        ],
      ),
    )));
  }

  /// show toast
  /// show snack bar
  /// show loading
  /// hide loading
}
