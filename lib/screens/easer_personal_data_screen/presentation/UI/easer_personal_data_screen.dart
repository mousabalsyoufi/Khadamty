import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/screens/easer_personal_data_screen/business_logic/provider/easer_personal_data_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utility/custom_validator.dart';
import '../../../../shared_widgets/custom_appbar.dart';
import '../../../../shared_widgets/custom_input_text.dart';

class EaserPersonalDataScreen extends StatefulWidget {
  const EaserPersonalDataScreen({Key? key}) : super(key: key);

  @override
  State<EaserPersonalDataScreen> createState() =>
      _EaserPersonalDataScreenState();
}

class _EaserPersonalDataScreenState extends State<EaserPersonalDataScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /* final TextEditingController phoneController = TextEditingController();

  final String initialCountry = 'FR';
  PhoneNumber? number; */

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<EaserPersonalDataProvider>(context, listen: false)
          .getAccount();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Personal information'),
      body:
          Consumer<EaserPersonalDataProvider>(builder: (context, provider, _) {
        if (provider.isLoading) {
          return const CustomProgressIndicator(color: AppColors.blackColor);
        } else if (provider.account != null) {
          /*  number = PhoneNumber(
              isoCode: PhoneNumber.getISO2CodeByPrefix(
                  getCodeNumber(provider.account!.user_mobile)),
              phoneNumber: provider.account!.user_mobile); */
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 9.h,
                    ),
                    Text(
                      "Contact your major to change your information.",
                      style: AppTextStyles.header5InterGrey90
                          .copyWith(color: AppColors.blackColor),
                    ),
                    SizedBox(
                      height: 19.h,
                    ),
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
                            "Full name",
                            style: AppTextStyles.robotoBoldBlack(12.sp),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomTextField(
                            enableField: false,
                            borderColor: AppColors.grey40Color,
                            intialText: provider.account!.firstname,
                            textInputAction: TextInputAction.next,
                            hintStyle: AppTextStyles.robotoRegularGrey50
                                .copyWith(fontSize: 14.sp),
                            onValid: (value) =>
                                CustomValidator.isRequired(value),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text("Email",
                              style: AppTextStyles.robotoBoldBlack(12.sp)),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomTextField(
                            enableField: false,
                            borderColor: AppColors.grey40Color,
                            textInputAction: TextInputAction.next,
                            intialText: provider.account!.email,
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
                          CustomTextField(
                            enableField: false,
                            borderColor: AppColors.grey40Color,
                            intialText: provider.account!.user_mobile,
                            textInputAction: TextInputAction.next,
                            hintStyle: AppTextStyles.robotoRegularGrey50
                                .copyWith(fontSize: 14.sp),
                            onValid: (value) =>
                                CustomValidator.isRequired(value),
                          ),
                          /*  PhoneNumberField(
                              hintTextStyle: AppTextStyles.robotoRegularGrey50
                                  .copyWith(fontSize: 14.sp),
                              number: number!,
                              controller: phoneController), */
                          SizedBox(
                            height: 15.h,
                          ),
                          Text("Address",
                              style: AppTextStyles.robotoBoldBlack(12.sp)),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomTextField(
                            enableField: false,
                            borderColor: AppColors.grey40Color,
                            intialText: provider.account!.address,
                            textInputAction: TextInputAction.next,
                            hintStyle: AppTextStyles.robotoRegularGrey50
                                .copyWith(fontSize: 14.sp),
                            onValid: (value) =>
                                CustomValidator.isRequired(value),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Zip code",
                                      style:
                                          AppTextStyles.robotoBoldBlack(12.sp)),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  SizedBox(
                                    width: 73.w,
                                    child: CustomTextField(
                                      borderColor: AppColors.grey40Color,
                                      intialText: provider.account!.zip,
                                      textInputAction: TextInputAction.next,
                                      hintStyle: AppTextStyles
                                          .robotoRegularGrey50
                                          .copyWith(fontSize: 14.sp),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      textType: TextInputType.number,
                                      onValid: (value) =>
                                          CustomValidator.validateOnlyNumber(
                                              value,
                                              num: 4),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Town",
                                      style:
                                          AppTextStyles.robotoBoldBlack(12.sp)),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  SizedBox(
                                    width: 190.w,
                                    child: CustomTextField(
                                      borderColor: AppColors.grey40Color,
                                      intialText: provider.account!.town,
                                      textInputAction: TextInputAction.next,
                                      hintStyle: AppTextStyles
                                          .robotoRegularGrey50
                                          .copyWith(fontSize: 14.sp),
                                      onValid: (value) =>
                                          CustomValidator.validateNumOfChar(
                                              value,
                                              num: 10),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          /* SizedBox(
                            height: 15.h,
                          ),
                          Text("Easer type",
                              style: AppTextStyles.robotoBoldBlack(12.sp)),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            decoration: _boxDecorationTextInput,
                            child: CustomDropDownList(
                              hint: 'Select Option',
                              hintTextStyle: AppTextStyles.robotoRegularGrey50
                                  .copyWith(fontSize: 14.sp),
                              onChanged: (String? value) {},
                              options: ['Putting green'],
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text("ID Easer",
                              style: AppTextStyles.robotoBoldBlack(12.sp)),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomTextField(
                            borderColor: AppColors.grey40Color,
                            hint: '#123456',
                            hintStyle: AppTextStyles.robotoRegularGrey50
                                .copyWith(fontSize: 14.sp),
                            onValid: (value) =>
                                CustomValidator.isRequired(value),
                          ), */
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    ),
                    /* SizedBox(
                      height: 22.h,
                    ),
                    CustomButtonBlack(
                        buttonContent: const Text("Save changes"),
                        onPressed: () {
                          // _formKey.currentState!.validate();
                        }), */
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }

  String getCodeNumber(String? phoneNumber) {
    if (phoneNumber != null && phoneNumber.length > 8) {
      return phoneNumber.substring(0, phoneNumber.length - 9);
    }
    return "+33";
  }

  /* final BoxDecoration _boxDecorationTextInput = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5.r)),
      border: Border.all(color: AppColors.grey40Color, width: 1)); */
}
