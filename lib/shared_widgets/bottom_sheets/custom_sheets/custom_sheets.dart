import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/custom_sheets/sheets_widgets/custom_location_picker_bottom_sheet.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/custom_sheets/sheets_widgets/icon_text_two_buttons.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/custom_sheets/sheets_widgets/icon_text_two_buttons_column_bottom_sheet.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/custom_sheets/sheets_widgets/icon_two_text_button_bottom_sheet.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/custom_sheets/sheets_widgets/icon_two_text_two_buttons_bottom_sheet.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/custom_sheets/sheets_widgets/icon_two_text_two_buttons_column_bottom_sheet.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/custom_sheets/sheets_widgets/text_text_button_bottom_sheet.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/custom_sheets/sheets_widgets/text_text_two_buttons_bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors/colors.dart';
import 'sheets_widgets/icon_text_button_bottom_sheet.dart';

class CustomSheets {
  static void showLocationPickerBottomSheet(BuildContext context) {
    // show location picker sheet
    showModalBottomSheet(
        context: context,
        backgroundColor: AppColors.transparentColor,
        builder: (BuildContext context) {
          return const CustomLocationPickerBottomSheet();
        });
  }

  static void showTextTextButtonBottomSheet({
    required BuildContext context,
    required String headlineText,
    required String contentText,
    required String buttonText,
    required Function buttonTapFunction,
  }) {
    // show headline text with content text with one button bottom sheet
    showModalBottomSheet(
        context: context,
        backgroundColor: AppColors.transparentColor,
        builder: (BuildContext context) {
          return TextTextButtonBottomSheet(
            headlineText: headlineText,
            contentText: contentText,
            buttonText: buttonText,
            buttonTapFunction: buttonTapFunction,
          );
        });
  }

  static void showIconTextButtonBottomSheet({
    required BuildContext context,
    required String iconPath,
    required String contentText,
    required String buttonText,
    required Function buttonTapFunction,
  }) {
    // show one icon with content text with one button bottom sheet
    showModalBottomSheet(
        context: context,
        backgroundColor: AppColors.transparentColor,
        builder: (BuildContext context) {
          return IconTextButtonBottomSheet(
            iconPath: iconPath,
            contentText: contentText,
            buttonText: buttonText,
            buttonTapFunction: buttonTapFunction,
          );
        });
  }

  static void showIconTextTwoButtonBottomSheet(
      {required BuildContext context,
      required String iconPath,
      required String contentText,
      required String acceptButtonText,
      required String rejectButtonText,
      required Color acceptButtonColor,
      required Color rejectButtonColor,
      required Function acceptButtonTapFunction,
      required Function rejectButtonTapFunction,
      required TextStyle acceptButtonStyle,
      required TextStyle rejectButtonStyle,
      required double buttonWidth,
      required Color borderColor}) {
    // show one icon with content text with two buttons bottom sheet
    showModalBottomSheet(
        context: context,
        backgroundColor: AppColors.transparentColor,
        builder: (BuildContext context) {
          return IconTextTwoButtonBottomSheet(
            borderColor: borderColor,
            iconPath: iconPath,
            contentText: contentText,
            acceptButtonColor: acceptButtonColor,
            acceptButtonTapFunction: acceptButtonTapFunction,
            acceptButtonText: acceptButtonText,
            acceptButtonStyle: acceptButtonStyle,
            rejectButtonStyle: rejectButtonStyle,
            rejectButtonColor: rejectButtonColor,
            rejectButtonTapFunction: rejectButtonTapFunction,
            rejectButtonText: rejectButtonText,
            buttonWidth: buttonWidth,
          );
        });
  }

  static void showTextTextTwoButtonBottomSheet(
      {required BuildContext context,
      required String headlineText,
      required String contentText,
      required String acceptButtonText,
      required String rejectButtonText,
      required Color acceptButtonColor,
      required Color rejectButtonColor,
      required Function acceptButtonTapFunction,
      required Function rejectButtonTapFunction,
      required TextStyle acceptButtonStyle,
      required TextStyle rejectButtonStyle,
      required double buttonWidth,
      required Color borderColor}) {
    // show one icon with content text with two buttons bottom sheet
    showModalBottomSheet(
        context: context,
        backgroundColor: AppColors.transparentColor,
        builder: (BuildContext context) {
          return TextTextTwoButtonBottomSheet(
            headlineText: headlineText,
            contentText: contentText,
            borderColor: borderColor,
            acceptButtonColor: acceptButtonColor,
            acceptButtonTapFunction: acceptButtonTapFunction,
            acceptButtonText: acceptButtonText,
            acceptButtonStyle: acceptButtonStyle,
            rejectButtonStyle: rejectButtonStyle,
            rejectButtonColor: rejectButtonColor,
            rejectButtonTapFunction: rejectButtonTapFunction,
            rejectButtonText: rejectButtonText,
            buttonWidth: buttonWidth,
          );
        });
  }

  static void showIconTextTwoButtonColumnBottomSheet(
      {required BuildContext context,
      required String iconPath,
      required String contentText,
      required String acceptButtonText,
      required String rejectButtonText,
      required Color acceptButtonColor,
      required Color rejectButtonColor,
      required Function acceptButtonTapFunction,
      required Function rejectButtonTapFunction,
      required TextStyle acceptButtonStyle,
      required TextStyle rejectButtonStyle,
      required Color borderColor}) {
    // show one icon with content text with two buttons in column bottom sheet
    showModalBottomSheet(
        context: context,
        backgroundColor: AppColors.transparentColor,
        builder: (BuildContext context) {
          return IconTextTwoButtonColumnBottomSheet(
            borderColor: borderColor,
            iconPath: iconPath,
            contentText: contentText,
            acceptButtonColor: acceptButtonColor,
            acceptButtonTapFunction: acceptButtonTapFunction,
            acceptButtonText: acceptButtonText,
            acceptButtonStyle: acceptButtonStyle,
            rejectButtonStyle: rejectButtonStyle,
            rejectButtonColor: rejectButtonColor,
            rejectButtonTapFunction: rejectButtonTapFunction,
            rejectButtonText: rejectButtonText,
          );
        });
  }

  static void showIconTextTextTwoButtonBottomSheet(
      {required BuildContext context,
      required String headlineText,
      required String contentText,
      required String acceptButtonText,
      required String rejectButtonText,
      required Color acceptButtonColor,
      required Color rejectButtonColor,
      required Function acceptButtonTapFunction,
      required Function rejectButtonTapFunction,
      required TextStyle acceptButtonStyle,
      required TextStyle rejectButtonStyle,
      required double buttonWidth,
      required Color borderColor,
      required String iconPath,
      double? height}) {
    // show one icon with two content text with two buttons bottom sheet
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: AppColors.transparentColor,
        builder: (BuildContext context) {
          return IconTextTextTwoButtonBottomSheet(
            headlineText: headlineText,
            contentText: contentText,
            borderColor: borderColor,
            acceptButtonColor: acceptButtonColor,
            acceptButtonTapFunction: acceptButtonTapFunction,
            acceptButtonText: acceptButtonText,
            acceptButtonStyle: acceptButtonStyle,
            rejectButtonStyle: rejectButtonStyle,
            rejectButtonColor: rejectButtonColor,
            rejectButtonTapFunction: rejectButtonTapFunction,
            rejectButtonText: rejectButtonText,
            buttonWidth: buttonWidth,
            iconPath: iconPath,
          );
        });
  }

  static void showIconTextTextTwoButtonColumnBottomSheet({
    required BuildContext context,
    required String headlineText,
    required String contentText,
    required String acceptButtonText,
    required String rejectButtonText,
    required Color acceptButtonColor,
    required Color rejectButtonColor,
    required Function acceptButtonTapFunction,
    required Function rejectButtonTapFunction,
    required TextStyle acceptButtonStyle,
    required TextStyle rejectButtonStyle,
    required Color borderColor,
    required String iconPath,
  }) {
    // show one icon with two content text with two buttons in column bottom sheet
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: AppColors.transparentColor,
        builder: (BuildContext context) {
          return IconTextTextTwoButtonColumnBottomSheet(
            headlineText: headlineText,
            contentText: contentText,
            borderColor: borderColor,
            acceptButtonColor: acceptButtonColor,
            acceptButtonTapFunction: acceptButtonTapFunction,
            acceptButtonText: acceptButtonText,
            acceptButtonStyle: acceptButtonStyle,
            rejectButtonStyle: rejectButtonStyle,
            rejectButtonColor: rejectButtonColor,
            rejectButtonTapFunction: rejectButtonTapFunction,
            rejectButtonText: rejectButtonText,
            iconPath: iconPath,
          );
        });
  }

  static void showIconTextTextButtonBottomSheet(
      {required BuildContext context,
      required String headlineText,
      required String contentText,
      required String acceptButtonText,
      required Color acceptButtonColor,
      required Function acceptButtonTapFunction,
      required TextStyle acceptButtonStyle,
      required double buttonWidth,
      required Color borderColor,
      required String iconPath}) {
    // show one icon with two content text with two buttons bottom sheet
    showModalBottomSheet(
        context: context,
        backgroundColor: AppColors.transparentColor,
        builder: (BuildContext context) {
          return IconTextTextButtonBottomSheet(
            headlineText: headlineText,
            contentText: contentText,
            borderColor: borderColor,
            acceptButtonColor: acceptButtonColor,
            acceptButtonTapFunction: acceptButtonTapFunction,
            acceptButtonText: acceptButtonText,
            acceptButtonStyle: acceptButtonStyle,
            buttonWidth: buttonWidth,
            iconPath: iconPath,
          );
        });
  }
}
