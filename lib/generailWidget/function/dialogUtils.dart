
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';




class DialogUtils {
  static Future<void> showLoadingDialog({
    required BuildContext context,

  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>  AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(
              backgroundColor:Colors.white,
            ),
            SizedBox(width:20,),
            Text("Loading...."),

          ],),),
    );
  }
  static Future<void> showMessageDialog({
    required BuildContext context,
    required String text,
    VoidCallback? onPressedOk,
    VoidCallback? onPressedYes,
    VoidCallback? onPressedNo,
    bool showOkButton = false,
    bool showYesButton = false,
    bool showNoButton = false,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: Colors.white,
        content: Text(text),
        actions: [
          if (showYesButton)
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                onPressedYes?.call();
              },
              child: const Text("Yes"),
            ),

          if (showOkButton)
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                onPressedOk?.call();
              },
              child: const Text("OK"),
            ),

          if (showNoButton)
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text("No"),
            ),
        ],
      ),
    );
  }

  static Future<bool?> toastMsg({
    required String msg,
    required Color backgroundColor,
    required Color textColor,
    ToastGravity gravity=ToastGravity.CENTER
  }) {
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity:gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0,
    );
  }


}