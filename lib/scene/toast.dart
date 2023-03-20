import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VanToast {
  static void show(String msg) {
    Fluttertoast.showToast(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.75),
      msg: msg,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}
