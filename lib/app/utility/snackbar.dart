import 'package:flutter/material.dart';
import '/app/constant/global_key_constant.dart';

class SnackbarUtils {
  static void showSuccessSnackbar(String message) {
    GlobalKeyConstant.scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green, behavior: SnackBarBehavior.floating),
    );
  }

  static void showErrorSnackbar(String message) {
    GlobalKeyConstant.scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red, behavior: SnackBarBehavior.floating),
    );
  }

  static void clearSnackbars() {
    GlobalKeyConstant.scaffoldMessengerKey.currentState?.clearSnackBars();
  }
}
