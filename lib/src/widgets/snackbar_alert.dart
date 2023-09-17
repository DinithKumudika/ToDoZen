import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_zen/src/constants/colors.dart';

class SnackbarAlert extends GetSnackBar {
  const SnackbarAlert({
    required String title,
    required String message,
    required bool isError,
    super.key,
  }) : super(
          title: title,
          message: message,
          snackPosition: SnackPosition.BOTTOM,
          icon: isError
              ? const Icon(
                  Icons.cancel_rounded,
                  color: COLOR_LIGHT,
                )
              : const Icon(
                  Icons.check_circle_rounded,
                  color: COLOR_LIGHT,
                ),
          isDismissible: true,
          backgroundColor: isError ? COLOR_DANGER : COLOR_SUCCESS,
          duration: const Duration(seconds: 3),
        );
}
