import 'package:faciltateur_de_vies/constants/enums/user_type.dart';
import 'package:faciltateur_de_vies/core/local_storage/storage_manager.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../core/utility/custom_validator.dart';
import '../../../../core/utility/utility.dart';
import '../../../../routes/routes_names/routes_names.dart';
import '../../../../routes/routes_provider/routes_provider.dart';
import '../../../../shared_widgets/custom_button_black.dart';
import '../../../../shared_widgets/custom_input_text.dart';
import '../../../../shared_widgets/custom_screen_header.dart';
import '../../business_logic/provider/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Utility.changeStatusBarToWhite();
    return Scaffold(
      body: Consumer<LoginProvider>(builder: (context, loginProvider, child) {
        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomScreenHeader(
                    title: 'Sign in',
                    imageWidth: 137.w,
                    imageHeight: 39.h,
                    hasBackButton: true),
                SizedBox(
                  height: 26.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomTextField(
                    textInputAction: TextInputAction.next,
                    hint: 'Email',
                    enableField: loginProvider.isLoading ? false : true,
                    textType: TextInputType.emailAddress,
                    onValid: (value) => CustomValidator.validateEmail(value),
                    controller: email,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomTextField(
                    hint: 'Password',
                    enableField: loginProvider.isLoading ? false : true,
                    textType: TextInputType.visiblePassword,
                    onValid: (value) =>
                        CustomValidator.validateNumOfChar(value, num: 12),
                    isPassword: true,
                    controller: password,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        RoutingProvider.pushNamed(
                            routeName: Routes.forgetPasswordScreen);
                      },
                      child: Text(
                        'Forget Password?',
                        style: AppTextStyles.robotoRegularBlack(14.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomButtonBlack(
                      buttonContent: loginProvider.isLoading
                          ? const CustomProgressIndicator(
                              color: AppColors.whiteColor,
                            )
                          : const Text('Connect'),
                      onPressed: loginProvider.isLoading
                          ? () {}
                          : () async {
                              /*  UserType userType=  AccountHelper.getUserType(name: email.text, password: password.text);
                      StorageManager.setUserType(userType);
                      RoutingProvider.pushNamedAndRemoveAllBack(
                          routeName: Routes.mainScreen); */
                              if (_formKey.currentState!.validate()) {
                                bool loggedIn = await loginProvider.login(
                                    username: email.text,
                                    password: password.text);
                                if (loggedIn) {
                                  RoutingProvider.pushNamedAndRemoveAllBack(
                                      routeName: Routes.mainScreen);
                                }
                              }
                            }),
                ),
                SizedBox(
                  height: 190.h,
                ),
                if (StorageManager.getUserType() != UserType.easer)
                  Column(
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: AppTextStyles.header3Inter,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                        onTap: () {
                          RoutingProvider.pushNamed(
                              routeName: Routes.registerScreen);
                        },
                        child: Text(
                          'Create your account',
                          style: AppTextStyles.header3Inter
                              .copyWith(color: AppColors.blueColor),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  )
              ],
            ),
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    password.dispose();
    email.dispose();
    super.dispose();
  }
}
