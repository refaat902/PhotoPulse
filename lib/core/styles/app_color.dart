import 'package:flutter/material.dart';

class AppColors {
  static const Color mainColor = Color(0xff002E50);
  static const Color secoundaryColor = Color(0xff306B96);
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color slector = Color(0xff79C6FF);
  static final Color slectorOpacity = slector.withOpacity(0.18);
  static const Color hint = Color(0xffCA9E20);

  static const LinearGradient primaryColor = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xff002E50), Color(0xff0069B6)],
  );

  static const Color textFormFieldBackGround = Color(0xffF6F6F6);
  static const Color textFormFieldBorderSide = Color(0xffDBDBDB);
  static const Color textFormFieldHintText = Color(0xff636363);

  static const Color darkGreyColor = Color(0xff595959);
  static const Color greyColor = Color(0xffD9D9D9);
  static const Color switchOnColor = Color(0xff1DC9A0);
  static const Color doneColor = Color(0xffFCC528);
  static const Color cancelColor = Color(0xffFFF7F7);
  static const Color finishColor = Color(0xffF0FFF5);
  static const Color alertColor = Color(0xffFB5C5C);
}
