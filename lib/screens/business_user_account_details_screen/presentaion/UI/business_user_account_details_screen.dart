import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/routes/routes_names/routes_names.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/bussiness_logic/provider/register_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../core/utility/custom_validator.dart';
import '../../../../shared_widgets/custom_appbar.dart';
import '../../../../shared_widgets/custom_button_black.dart';
import '../../../../shared_widgets/custom_input_text.dart';

class BusinessUserAccountDetails extends StatefulWidget {
  const BusinessUserAccountDetails({Key? key}) : super(key: key);

  @override
  State<BusinessUserAccountDetails> createState() =>
      _BusinessUserAccountDetailsState();
}

class _BusinessUserAccountDetailsState extends State<BusinessUserAccountDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController corporateNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController quarterHeaderController = TextEditingController();
  TextEditingController ibanController = TextEditingController();
  TextEditingController siretController = TextEditingController();

  @override
  void dispose() {
    corporateNameController.dispose();
    addressController.dispose();
    quarterHeaderController.dispose();
    ibanController.dispose();
    siretController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Utility.changeStatusBarToTransparent();
    return Scaffold(
      body: Scaffold(
        appBar: customAppBar('Your company details'),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(20.r),
          // child: CustomButtonBlack(
          //   onPressed: () async {
          //   },
          //   buttonContent: const Text('Continue'),
          // ),
        ),
        body: Consumer<RegisterProvider>(
            builder: (context, registerProvider, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 29.h),
              child: Form(
                key: _formKey,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(5.r)),
                  padding: EdgeInsets.all(20.r),
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
                        fillColor: AppColors.grey10Color,
                        hint: 'corporate name',
                        controller: corporateNameController,
                        textInputAction: TextInputAction.next,
                        hintStyle: AppTextStyles.robotoRegularGrey50
                            .copyWith(fontSize: 14.sp),
                        onValid: (value) => CustomValidator.isRequired(value),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "Address",
                        style: AppTextStyles.robotoBoldBlack(12.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        fillColor: AppColors.grey10Color,
                        hint: 'address',
                        controller: addressController,
                        textInputAction: TextInputAction.next,
                        hintStyle: AppTextStyles.robotoRegularGrey50
                            .copyWith(fontSize: 14.sp),
                        onValid: (value) => CustomValidator.isRequired(value),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "Quarter header",
                        style: AppTextStyles.robotoBoldBlack(12.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        fillColor: AppColors.grey10Color,
                        hint: 'quarter header',
                        controller: quarterHeaderController,
                        textInputAction: TextInputAction.next,
                        hintStyle: AppTextStyles.robotoRegularGrey50
                            .copyWith(fontSize: 14.sp),
                        onValid: (value) => CustomValidator.isRequired(value),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "IBAN",
                        style: AppTextStyles.robotoBoldBlack(12.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        fillColor: AppColors.grey10Color,
                        hint: 'IBAN',
                        controller: ibanController,
                        textType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        hintStyle: AppTextStyles.robotoRegularGrey50
                            .copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "SIRET",
                        style: AppTextStyles.robotoBoldBlack(12.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        fillColor: AppColors.grey10Color,
                        hint: 'SIRET',
                        controller: siretController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textInputAction: TextInputAction.done,
                        textType: TextInputType.number,
                        hintStyle: AppTextStyles.robotoRegularGrey50
                            .copyWith(fontSize: 14.sp),
                        onValid: (value) => CustomValidator.isRequired(value),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      CustomButtonBlack(
                        onPressed: registerProvider.isLoading
                            ? () {}
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  bool otpSent = await registerProvider.sendOtp(
                                      phoneNumber: registerProvider
                                          .requestCompanyModel!.phoneNumber);
                                  if (otpSent) {
                                    registerProvider
                                        .setUserRegisterCompanyAccountData(
                                            iban: ibanController.text,
                                            label:
                                                '${corporateNameController.text} + " , " + ${addressController.text} + "," + ${quarterHeaderController.text} + "," + ${siretController.text}',
                                            name: registerProvider
                                                .requestCompanyModel!.fullName,
                                            email:
                                                registerProvider
                                                    .requestCompanyModel!.email,
                                            phone:
                                                registerProvider
                                                    .requestCompanyModel!
                                                    .phoneNumber,
                                            password: registerProvider
                                                .requestCompanyModel!.password);

                                    RoutingProvider.pushNamed(
                                        routeName:
                                            Routes.otpVerificationScreen);
                                  }
                                }
                              },
                        buttonContent: registerProvider.isLoading
                            ? const CustomProgressIndicator(
                                color: AppColors.whiteColor,
                              )
                            : const Text('Continue'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
