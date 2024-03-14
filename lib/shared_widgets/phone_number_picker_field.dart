import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../constants/colors/colors.dart';
import '../core/utility/custom_validator.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({
    Key? key,
    required this.number,
    required this.controller,
    this.inputBorderColor = AppColors.grey40Color,
    this.fillColor = AppColors.whiteColor,
    this.textColor = AppColors.blackColor,
    this.hintTextStyle,
    this.updatePhoneNumber,
    this.enabled = true,
  }) : super(key: key);
  final TextStyle? hintTextStyle;
  final PhoneNumber number;
  final TextEditingController controller;
  final Color inputBorderColor;
  final Color fillColor;
  final Color textColor;
  final bool enabled;
  final Function(PhoneNumber number)? updatePhoneNumber;

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      hintText: '6 12 34 56 78',
      maxLength: 9,
      isEnabled: enabled,
      textStyle: TextStyle(color: textColor),
      onInputChanged: (PhoneNumber number) {
        if (updatePhoneNumber != null) {
          updatePhoneNumber!(number);
        }
      },
      validator: (phoneNumber) =>
          CustomValidator.validatePhoneNumberLength(phoneNumber),
      selectorConfig: SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          showFlags: true,
          leadingPadding: 10.w,
          trailingSpace: false,
          useEmoji: false),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: TextStyle(color: textColor),
      inputDecoration: InputDecoration(
        fillColor: fillColor,
        filled: true,
        hintText: '6 12 34 56 78',
        hintStyle: hintTextStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          borderSide: BorderSide(color: inputBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          borderSide: BorderSide(color: inputBorderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          borderSide: BorderSide(color: inputBorderColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          borderSide: BorderSide(color: inputBorderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
      ),
      initialValue: number,
      textFieldController: controller,
      formatInput: false,
      searchBoxDecoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          borderSide: const BorderSide(color: AppColors.grey40Color),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          borderSide: const BorderSide(color: AppColors.grey40Color),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          borderSide: const BorderSide(color: AppColors.grey40Color),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
      ),
      keyboardType:
          const TextInputType.numberWithOptions(signed: false, decimal: true),
      inputBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.redColor, width: 1),
          borderRadius: BorderRadius.circular(5.r)),
      onSaved: (PhoneNumber number) {},
    );
  }
}
