import '../colors/colors.dart';
import '../fonts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// These class to define the styles in app for text
class AppTextStyles {
  // Inter Font TextStyle
  static TextStyle header1Inter = TextStyle(
      fontSize: 18.sp,
      color: AppColors.blackColor,
      fontFamily: AppFonts.interFamily,
      fontWeight: FontWeight.bold);
  static TextStyle header2Inter = TextStyle(
      fontSize: 16.sp,
      color: AppColors.blackColor,
      fontFamily: AppFonts.interFamily,
      fontWeight: FontWeight.bold);
  static TextStyle header3Inter = TextStyle(
      fontSize: 14.sp,
      color: AppColors.blackColor,
      fontFamily: AppFonts.interFamily,
      fontWeight: FontWeight.bold);
  static TextStyle header4Inter = TextStyle(
      fontSize: 12.sp,
      color: AppColors.blackColor,
      fontFamily: AppFonts.interFamily,
      fontWeight: FontWeight.bold);

  static TextStyle header4InterGrey70 = TextStyle(
      fontSize: 12.sp,
      color: AppColors.grey70Color,
      fontFamily: AppFonts.interFamily,
      fontWeight: FontWeight.bold);

  static TextStyle header4InterGrey50 = TextStyle(
      fontSize: 12.sp,
      color: AppColors.grey50Color,
      fontFamily: AppFonts.interFamily,
      fontWeight: FontWeight.bold);
  static TextStyle header5Inter = TextStyle(
      fontSize: 12.sp,
      color: AppColors.blackColor,
      fontFamily: AppFonts.interFamily,
      // medium
      fontWeight: FontWeight.w500);
  static TextStyle interMeduimGrey = TextStyle(
      fontSize: 10.sp,
      color: AppColors.grey50Color,
      fontFamily: AppFonts.interFamily,
      fontWeight: FontWeight.w500);

  static TextStyle interMeduimWhite = TextStyle(
      fontSize: 15.sp,
      color: AppColors.whiteColor,
      fontFamily: AppFonts.interFamily,
      fontWeight: FontWeight.w500);

  static TextStyle interMeduimBlack = TextStyle(
      fontSize: 12.sp,
      color: AppColors.blackColor,
      fontFamily: AppFonts.interFamily,
      fontWeight: FontWeight.w500);

  static TextStyle interRegularBlack = TextStyle(
      fontSize: 12.sp,
      color: AppColors.blackColor,
      fontFamily: AppFonts.interFamily,
      fontWeight: FontWeight.w400);
  static TextStyle interExtraBold(double fontSize) => TextStyle(
      fontSize: fontSize,
      color: AppColors.whiteColor,
      fontFamily: AppFonts.interFamily,
      fontWeight: FontWeight.w800);
  static TextStyle header5InterGrey90 = TextStyle(
      fontSize: 10.sp,
      color: AppColors.grey50Color,
      fontFamily: AppFonts.interFamily,
      fontWeight: FontWeight.w500);

  // Roboto Font TextStyle.
  static TextStyle robotoBoldWhite = TextStyle(
      fontSize: 16.sp,
      color: AppColors.whiteColor,
      fontFamily: AppFonts.robotoFamily,
      fontWeight: FontWeight.bold);
  static TextStyle robotoRegularBlack(double fontSize) => TextStyle(
      fontSize: fontSize.sp,
      color: AppColors.blackColor,
      fontFamily: AppFonts.robotoFamily,
      fontWeight: FontWeight.w400);
  static TextStyle robotoMediumBlack = TextStyle(
      fontSize: 12.sp,
      color: AppColors.blackColor,
      fontFamily: AppFonts.robotoFamily,
      fontWeight: FontWeight.w500);
  static TextStyle robotoMediumWhite = TextStyle(
      fontSize: 14.sp,
      color: AppColors.whiteColor,
      fontFamily: AppFonts.robotoFamily,
      fontWeight: FontWeight.w500);
  static TextStyle robotoRegularWhite = TextStyle(
      fontSize: 10.sp,
      color: AppColors.whiteColor,
      fontFamily: AppFonts.robotoFamily,
      fontWeight: FontWeight.w500);
  static TextStyle robotoRegularGrey50 = TextStyle(
      fontSize: 9.sp,
      color: AppColors.grey50Color,
      fontFamily: AppFonts.robotoFamily,
      fontWeight: FontWeight.w500);
  static TextStyle robotoBoldBlack(double fontSize) => TextStyle(
      fontSize: fontSize,
      color: AppColors.blackColor,
      fontFamily: AppFonts.robotoFamily,
      fontWeight: FontWeight.bold);
  static TextStyle paragraph1Roboto = TextStyle(
      fontSize: 14.sp,
      color: AppColors.grey80Color,
      fontFamily: AppFonts.robotoFamily,
      fontWeight: FontWeight.w400);
  static TextStyle paragraph2Roboto = TextStyle(
      fontSize: 12.sp,
      color: AppColors.grey80Color,
      fontFamily: AppFonts.robotoFamily,
      fontWeight: FontWeight.w400);
  static TextStyle paragraph3Roboto = TextStyle(
      fontSize: 10.sp,
      color: AppColors.grey60Color,
      fontFamily: AppFonts.robotoFamily,
      fontWeight: FontWeight.w400);

  static TextStyle paragraphRobotoMedium = TextStyle(
      fontSize: 14.sp,
      color: AppColors.blackColor,
      fontFamily: AppFonts.robotoFamily,
      fontWeight: FontWeight.w500);

  static TextStyle paragraph2RobotoWhite = TextStyle(
      fontSize: 12.sp,
      color: AppColors.whiteColor,
      fontFamily: AppFonts.robotoFamily,
      fontWeight: FontWeight.w400);
}
