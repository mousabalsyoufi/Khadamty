import 'package:faciltateur_de_vies/constants/enums/user_type.dart';
import 'package:faciltateur_de_vies/routes/routes_names/routes_names.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/bussiness_logic/provider/register_provider.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/model/register_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../core/utility/utility.dart';
import '../../../../shared_widgets/custom_back_button.dart';
import '../../../../shared_widgets/custom_button_black.dart';
import '../../../../shared_widgets/custom_progress_indicator.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Utility.changeStatusBarToTransparent();
    return Scaffold(
      body: Stack(
        children: [
          Consumer<RegisterProvider>(
              builder: (context, registerProvider, child) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 250.h,
                  ),
                  Center(
                    child: Text(
                      'Enter the verification code',
                      style: AppTextStyles.header1Inter,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    'A code was sent to you by SMS:',
                    style: AppTextStyles.robotoRegularBlack(14.sp),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: PinFieldAutoFill(
                      controller: otpController,
                      cursor: Cursor(
                          color: AppColors.blackColor, width: 1, enabled: true),
                      decoration:  BoxLooseDecoration(
                        strokeColorBuilder:
                            FixedColorBuilder(AppColors.whiteColor),
                        bgColorBuilder: FixedColorBuilder(AppColors.whiteColor),
                      ),
                      onCodeSubmitted: (code) {},
                      onCodeChanged: (code) {},
                      codeLength: 4,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomButtonBlack(
                        buttonContent: registerProvider.isLoading
                            ? const CustomProgressIndicator(
                                color: AppColors.whiteColor,
                              )
                            : const Text('Confirm'),
                        onPressed: registerProvider.isLoading
                            ? () {}
                            : () async {
                                if (otpController.text.isEmpty) {
                                  Utility.showToast(message: 'Please enter the code and try again');
                                  return;
                                }
                                bool verified = await registerProvider.verifyOtp(otpCode: otpController.text);
                                if (verified) {
                                  bool registered = false;
                                  if(registerProvider.userType == UserType.business){
                                    registered  = await registerProvider
                                        .registerCompany(registerRequestModel:registerProvider.requestCompanyModel!);

                                  }else if ( registerProvider.userType == UserType.user ){
                                    registered  = await registerProvider
                                        .register(
                                        registerRequestModel:
                                        RegisterRequestModel(
                                            fullName:
                                            registerProvider.fullName,
                                            email: registerProvider.email,
                                            phoneNumber: registerProvider
                                                .phoneNumber,
                                            password:
                                            registerProvider.password,
                                            groupId: '2',
                                            type: 0));
                                  }

                                  if (registered) {
                                    RoutingProvider.pushNamedAndRemoveAllBack(
                                        routeName: Routes.loginScreen);
                                  }
                                }
                              }),
                  ),
                  SizedBox(
                    height: 170.h,
                  ),
                  Text(
                    'Didn\'t receive?',
                    style: AppTextStyles.robotoBoldBlack(16.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    onTap: () {
                      registerProvider.sendOtp(
                          phoneNumber: registerProvider.phoneNumber);
                    },
                    child: Text(
                      'Send again',
                      style: AppTextStyles.robotoBoldBlack(16.sp).copyWith(
                        color: AppColors.blueColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 55.h,
                  ),
                ],
              ),
            );
          }),
          const Positioned(
            top: 50,
            left: 10,
            child: CustomBackButton(),
          ),
        ],
      ),
    );
  }
}
