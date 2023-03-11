import '/../app/constants/font_constants.dart';
import '/../app/utils/size_utils.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  Color get hintColor => const Color(0xFFA5A9A9);

  Color get darkHintColor => const Color(0xFF9C9696);

  Color get blackColor => const Color(0xFF000000);

  Color get whiteColor => const Color(0xFFFFFFFF);

  Color get redColor => const Color(0xFFF62326);

  Color get colorPrimary => const Color(0xFF0AA2D7);

  Color get greenColor => const Color(0xFF1DB810);

  Color get colorPrimaryLight => const Color(0xFF77aafc);

  Color get textFieldBorder => const Color(0xFFCED3D3);

  TextStyle? get textSemiBold14Hint => TextStyle(
        fontSize: getFontSize(14),
        fontFamily: Semibold,
        color: hintColor,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get textSemiBold14DarkHint => TextStyle(
        fontSize: getFontSize(14),
        fontFamily: Semibold,
        color: darkHintColor,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get textBold14Hint => TextStyle(
        fontSize: getFontSize(14),
        fontFamily: Bold,
        color: hintColor,
        fontWeight: FontWeight.w700,
      );

  TextStyle? get textBold14Primary => TextStyle(
        fontSize: getFontSize(14),
        fontFamily: Bold,
        color: colorPrimary,
        fontWeight: FontWeight.w700,
      );

  TextStyle? get textBold14White => TextStyle(
        fontSize: getFontSize(14),
        fontFamily: Bold,
        color: whiteColor,
        fontWeight: FontWeight.w700,
      );

  TextStyle? get textSemiBold14Black => TextStyle(
        fontSize: getFontSize(14),
        fontFamily: Semibold,
        color: blackColor,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get textSemiBold14Primary => TextStyle(
        fontSize: getFontSize(14),
        fontFamily: Semibold,
        color: colorPrimary,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get textSemiBold14White => TextStyle(
        fontSize: getFontSize(14),
        fontFamily: Semibold,
        color: whiteColor,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get textSemiBold20Black => TextStyle(
        fontSize: getFontSize(20),
        fontFamily: Semibold,
        color: blackColor,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get textSemiBold18Black => TextStyle(
        fontSize: getFontSize(18),
        fontFamily: Semibold,
        color: blackColor,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get textSemiBold18White => TextStyle(
        fontSize: getFontSize(18),
        fontFamily: Semibold,
        color: whiteColor,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get textSemiBold18Hint => TextStyle(
        fontSize: getFontSize(18),
        fontFamily: Semibold,
        color: hintColor,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get textSemiBold16Black => TextStyle(
        fontSize: getFontSize(16),
        fontFamily: Semibold,
        color: blackColor,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get textSemiBold16Hint => TextStyle(
        fontSize: getFontSize(16),
        fontFamily: Semibold,
        color: hintColor,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get textSemiBold16White => TextStyle(
        fontSize: getFontSize(16),
        fontFamily: Semibold,
        color: whiteColor,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get textSemiBold16Primary => TextStyle(
        fontSize: getFontSize(16),
        fontFamily: Semibold,
        color: colorPrimary,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get textSemiBold12Primary => TextStyle(
        fontSize: getFontSize(12),
        fontFamily: Semibold,
        color: colorPrimary,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get textSemiBold12Hint => TextStyle(
        fontSize: getFontSize(12),
        fontFamily: Semibold,
        color: hintColor,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get textRegular14LightGrey => TextStyle(
        fontSize: getFontSize(14),
        fontFamily: Regular,
        color: hintColor,
        fontWeight: FontWeight.w400,
      );

  TextStyle? get textRegular14Hint => TextStyle(
        fontSize: getFontSize(14),
        fontFamily: Regular,
        color: hintColor,
        fontWeight: FontWeight.w400,
      );

  TextStyle? get textRegular10Hint => TextStyle(
        fontSize: getFontSize(10),
        fontFamily: Regular,
        color: hintColor,
        fontWeight: FontWeight.w400,
      );

  TextStyle? get textRegular12DarkHint => TextStyle(
        fontSize: getFontSize(12),
        fontFamily: Regular,
        color: darkHintColor,
        fontWeight: FontWeight.w400,
      );

  TextStyle? get textRegular14Primary => TextStyle(
        fontSize: getFontSize(14),
        fontFamily: Regular,
        color: colorPrimary,
        fontWeight: FontWeight.w400,
      );

  TextStyle? get textBold24Black => TextStyle(
        fontSize: getFontSize(24),
        fontFamily: Bold,
        color: blackColor,
        fontWeight: FontWeight.w700,
      );

  TextStyle? get textBold18Black => TextStyle(
        fontSize: getFontSize(18),
        fontFamily: Bold,
        color: blackColor,
        fontWeight: FontWeight.w700,
      );

  TextStyle? get textBold12Black => TextStyle(
        fontSize: getFontSize(12),
        fontFamily: Bold,
        color: blackColor,
        fontWeight: FontWeight.w700,
      );

  TextStyle? get textBold24Primary => TextStyle(
        fontSize: getFontSize(24),
        fontFamily: Bold,
        color: colorPrimary,
        fontWeight: FontWeight.w700,
      );

  TextStyle? get textBold18Primary => TextStyle(
        fontSize: getFontSize(18),
        fontFamily: Bold,
        color: colorPrimary,
        fontWeight: FontWeight.w700,
      );

  TextStyle? get textBold24Hint => TextStyle(
        fontSize: getFontSize(24),
        fontFamily: Bold,
        color: hintColor,
        fontWeight: FontWeight.w700,
      );
}
