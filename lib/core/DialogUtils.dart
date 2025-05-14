import 'package:evently/core/resources/ColorManager.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogUtils {
  static void showMessageDialog({
    required BuildContext context,
    required String message,
    required String posTitle,
    required void Function() posClick,
    String? negTitle,
    void Function()? negClick,
  }) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(message),
            actions: [
              ElevatedButton(onPressed: posClick, child: Text(posTitle)),
              Visibility(
                visible: negTitle != null,
                child: ElevatedButton(
                  onPressed: negClick,
                  child: Text(negTitle ?? ""),
                ),
              ),
            ],
          ),
    );
  }

  static showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,

      builder:
          (context) =>
              AlertDialog(title: Center(child: CircularProgressIndicator())),
    );
  }

  static showToast(String massage) {
    Fluttertoast.showToast(
      msg: massage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: ColorManager.black,
      fontSize: 12.0,
    );
  }
}
