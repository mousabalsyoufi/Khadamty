import 'dart:async';

import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_appbar.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../../core/utility/utility.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    Utility.changeStatusBarToTransparent();
    if (isLoading) {
      Timer(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
    }
    return Scaffold(
      appBar: customAppBar('Reset Password'),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
                url: Uri.parse(
                    "https://www.erp.dev.facilitateurdevies.com/user/passwordforgotten.php")),
            onReceivedServerTrustAuthRequest: (controller, challenge) async {
              return ServerTrustAuthResponse(
                  action: ServerTrustAuthResponseAction.PROCEED);
            },
          ),
          if(isLoading)
          const CustomProgressIndicator(color: AppColors.blackColor),
        ],
      ),
    );
    /* return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 50.h,
              left: 20.w,
              child: const CustomBackButton(),
            ),
            Column(
              children: [
                SizedBox(
                  height: 240.h,
                ),
                Text("Forgot password", style: AppTextStyles.header1Inter),
                SizedBox(
                  height: 23.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: Text(
                    "Enter your email address below to receive your reset link:",
                    style: AppTextStyles.robotoRegularBlack(14.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 44.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomTextField(
                    hint: 'Email',
                    onValid: (value) => CustomValidator.validateEmail(value),
                  ),
                ),
                SizedBox(
                  height: 44.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomButtonBlack(
                      buttonContent: const Text('Confirm'), onPressed: () {}),
                ),
              ],
            ),
          ],
        ),
      ),
    ); */
  }
}
