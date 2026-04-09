import 'package:flutter/material.dart';
import 'package:photopulse/core/widgets/texts/caption_text.dart';
import 'package:toastification/toastification.dart';
void showToast({
  required String text,
  required ToastStates state,
}) =>
    toastification.show(
        dragToClose: false,
        closeOnClick: false,
        autoCloseDuration: const Duration(seconds: 3),
        icon: state == ToastStates.SUCCESS
            ? const Icon(Icons.check_circle)
            : state == ToastStates.ERROR
            ? const Icon(Icons.report_gmailerrorred)
            : state == ToastStates.WARNING
            ? const Icon(Icons.warning_amber_rounded)
            : const Icon(Icons.info),
        type: state == ToastStates.SUCCESS
            ? ToastificationType.success
            : state == ToastStates.ERROR
            ? ToastificationType.error
            : state == ToastStates.WARNING
            ? ToastificationType.warning
            : ToastificationType.info,
        title: CaptionText(text: text, color: chooseToastColor(state),
          textAlign: TextAlign.start,
        ));

// enum
enum ToastStates { SUCCESS, ERROR, WARNING, NOTE }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
    case ToastStates.NOTE:
      color = Colors.grey;
      break;
  }
  return color;
}
