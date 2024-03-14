import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_button_black.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../core/utility/custom_validator.dart';
import '../../../../shared_widgets/custom_appbar.dart';
import '../../../../shared_widgets/custom_input_text.dart';
import '../../../../shared_widgets/phone_number_picker_field.dart';

class UserBusinessDataScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final String initialCountry = 'NG';
  final PhoneNumber number =
      PhoneNumber(isoCode: 'NG', phoneNumber: "0523423432");
  UserBusinessDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Company Data'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(5.r))),
                  padding: EdgeInsetsDirectional.only(
                      top: 12.h, start: 20.w, end: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Corporate name",
                        style: AppTextStyles.robotoBoldBlack(12.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        borderColor: AppColors.grey40Color,
                        textInputAction: TextInputAction.next,
                        hint: 'Corinne Dubois & Freres',
                        hintStyle: AppTextStyles.robotoRegularGrey50
                            .copyWith(fontSize: 14.sp),
                        onValid: (value) => CustomValidator.isRequired(value),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text("Address",
                          style: AppTextStyles.robotoBoldBlack(12.sp)),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        borderColor: AppColors.grey40Color,
                        textInputAction: TextInputAction.next,
                        hint: '42, rue de Bouvet07959 BerthelotBourg',
                        hintStyle: AppTextStyles.robotoRegularGrey50
                            .copyWith(fontSize: 14.sp),
                        onValid: (value) =>
                            CustomValidator.validateEmail(value),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text("Quarter header",
                          style: AppTextStyles.robotoBoldBlack(12.sp)),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        borderColor: AppColors.grey40Color,
                        textInputAction: TextInputAction.next,
                        hint: '42, rue de Bouvet07959 BerthelotBourg',
                        hintStyle: AppTextStyles.robotoRegularGrey50
                            .copyWith(fontSize: 14.sp),
                        onValid: (value) =>
                            CustomValidator.validateEmail(value),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text("IBAN", style: AppTextStyles.robotoBoldBlack(12.sp)),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        borderColor: AppColors.grey40Color,
                        textInputAction: TextInputAction.next,
                        hint: 'FR9610096000302233591472U69',
                        hintStyle: AppTextStyles.robotoRegularGrey50
                            .copyWith(fontSize: 14.sp),
                        onValid: (value) =>
                            CustomValidator.validateEmail(value),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text("SIRET",
                          style: AppTextStyles.robotoBoldBlack(12.sp)),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        textInputAction: TextInputAction.next,
                        borderColor: AppColors.grey40Color,
                        hint: '808 117 246 36249',
                        hintStyle: AppTextStyles.robotoRegularGrey50
                            .copyWith(fontSize: 14.sp),
                        onValid: (value) =>
                            CustomValidator.validateEmail(value),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text("Mobile",
                          style: AppTextStyles.robotoBoldBlack(12.sp)),
                      SizedBox(
                        height: 10.h,
                      ),
                      PhoneNumberField(
                          hintTextStyle: AppTextStyles.robotoRegularGrey50
                              .copyWith(fontSize: 14.sp),
                          number: number,
                          controller: phoneController),
                      SizedBox(
                        height: 80.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                CustomButtonBlack(
                    buttonContent: const Text("Save changes")   ,
                    onPressed: () {
                      // _formKey.currentState!.validate();
                    }),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
