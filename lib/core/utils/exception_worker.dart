import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

@lazySingleton
class ExceptionWorker {

  static const int animationDuration = 400;

  void errorWorker(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: message,
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
        textStyle: TextStyle(
          color: Theme.of(context).colorScheme.onErrorContainer,
          fontSize: 16,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 5),
            spreadRadius: 1,
            blurRadius: 15,
          ),
        ],
      ),
      snackBarPosition: SnackBarPosition.bottom,
      curve: Curves.easeInOutCubic,
      animationDuration: const Duration(milliseconds: animationDuration),
    );
  }

  void successWorker(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: message,
        //backgroundColor: Theme.of(context).colorScheme,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 5),
            spreadRadius: 1,
            blurRadius: 15,
          ),
        ],
      ),
      snackBarPosition: SnackBarPosition.bottom,
      curve: Curves.easeInOutCubic,
      animationDuration: const Duration(milliseconds: animationDuration),
    );
  }

  void infoWorker(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        message: message,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 5),
            spreadRadius: 1,
            blurRadius: 15,
          ),
        ],
      ),
      snackBarPosition: SnackBarPosition.bottom,
      curve: Curves.easeInOutCubic,
      animationDuration: const Duration(milliseconds: animationDuration),
    );
  }
}
