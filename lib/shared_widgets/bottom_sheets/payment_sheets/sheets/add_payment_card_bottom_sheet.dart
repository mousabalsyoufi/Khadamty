import 'package:faciltateur_de_vies/shared_widgets/custom_button_black.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../core/utility/custom_validator.dart';
import '../../../custom_input_text.dart';
import '../../widgets/bottom_sheet_header.dart';

class AddPaymentCardBottomSheet extends StatelessWidget {
  AddPaymentCardBottomSheet({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r)),
            color: AppColors.whiteColor,
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                const BottomSheetHeader(),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Add card informations',
                  style: AppTextStyles.header3Inter,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 20.w, right: 20.w, bottom: 40.h),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            borderColor: AppColors.grey40Color,
                            hint: 'Card number',
                            textInputAction: TextInputAction.next,
                            hintStyle: AppTextStyles.robotoRegularGrey50
                                .copyWith(fontSize: 14.sp),
                            onValid: (value) =>
                                CustomValidator.isRequired(value),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 135.w,
                                child: CustomTextField(
                                  borderColor: AppColors.grey40Color,
                                  hint: 'MM / YY',
                                  textInputAction: TextInputAction.next,
                                  hintStyle: AppTextStyles.robotoRegularGrey50
                                      .copyWith(fontSize: 14.sp),
                                  onValid: (value) =>
                                      CustomValidator.isRequired(value),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              SizedBox(
                                width: 135.w,
                                child: CustomTextField(
                                  borderColor: AppColors.grey40Color,
                                  hint: 'CVC',
                                  textInputAction: TextInputAction.next,
                                  hintStyle: AppTextStyles.robotoRegularGrey50
                                      .copyWith(fontSize: 14.sp),
                                  onValid: (value) =>
                                      CustomValidator.isRequired(value),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          CustomTextField(
                            borderColor: AppColors.grey40Color,
                            hint: 'Full name',
                            textInputAction: TextInputAction.next,
                            hintStyle: AppTextStyles.robotoRegularGrey50
                                .copyWith(fontSize: 14.sp),
                            onValid: (value) =>
                                CustomValidator.isRequired(value),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomTextField(
                            borderColor: AppColors.grey40Color,
                            hint: 'Billing address',
                            hintStyle: AppTextStyles.robotoRegularGrey50
                                .copyWith(fontSize: 14.sp),
                            onValid: (value) =>
                                CustomValidator.isRequired(value),
                          ),
                        ],
                      )),
                ),
                CustomButtonBlack(
                    buttonContent: const Text('Add'), onPressed: () {}),
              ],
            ),
          ),
        )
      ],
    );
  }
}
