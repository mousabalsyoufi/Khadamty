import 'package:faciltateur_de_vies/constants/enums/user_type.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/bussiness_logic/provider/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../core/utility/custom_validator.dart';
import '../../../../routes/routes_names/routes_names.dart';
import '../../../../routes/routes_provider/routes_provider.dart';
import '../../../../shared_widgets/custom_progress_indicator.dart';
import '../../../../shared_widgets/custom_radio_button.dart';
import '../../../../shared_widgets/custom_button_black.dart';
import '../../../../shared_widgets/custom_input_text.dart';
import '../../../../shared_widgets/phone_number_picker_field.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  PhoneNumber phoneNumber = PhoneNumber(isoCode: 'FR', phoneNumber: "");

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(
        builder: (context, registerProvider, child) {
      return Wrap(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 26.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomTextField(
                    hint: 'Full name',
                    controller: nameController,
                    enableField: registerProvider.isLoading ? false : true,
                    textInputAction: TextInputAction.next,
                    textType: TextInputType.name,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
                    ],
                    onValid: (value) => CustomValidator.isRequired(value),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomTextField(
                      hint: 'Email',
                      controller: emailController,
                      enableField: registerProvider.isLoading ? false : true,
                      textInputAction: TextInputAction.next,
                      onValid: (value) => CustomValidator.validateEmail(value)),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: PhoneNumberField(
                    number: phoneNumber,
                    controller: phoneController,
                    fillColor: AppColors.whiteColor,
                    hintTextStyle:
                        const TextStyle(color: AppColors.grey40Color),
                    inputBorderColor: AppColors.transparentColor,
                    updatePhoneNumber: (number) {
                      phoneNumber = number;
                    },
                  ),
                ),
                /* SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomTextField(
                  hint: '+33 00 00 00 00 00',
                  controller: phoneController,
                  enableField: registerProvider.isLoading ? false : true,
                  onValid: (value) => CustomValidator.validatePhoneNumber(
                    value,
                  ),
                ),
              ), */
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomTextField(
                    hint: 'Password',
                    controller: passwordController,
                    enableField: registerProvider.isLoading ? false : true,
                    onValid: (value) => CustomValidator.validatePassword(
                      value,
                    ),
                    isPassword: true,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomRadioButton(
                        value:
                            registerProvider.userType == UserType.user ? 1 : 0,
                        onChanged: (int? value) {
                          registerProvider.changeUserType(UserType.user);
                        },
                        title: 'Individual',
                        groupValue: 1,
                        selectedTextStyle: AppTextStyles.robotoBoldBlack(14.sp),
                        unselectedTextStyle:
                            AppTextStyles.robotoRegularBlack(14.sp),
                      ),
                      CustomRadioButton(
                        value: registerProvider.userType == UserType.business
                            ? 1
                            : 0,
                        onChanged: (int? value) {
                          registerProvider.changeUserType(UserType.business);
                        },
                        title: 'Company',
                        groupValue: 1,
                        selectedTextStyle: AppTextStyles.robotoBoldBlack(14.sp),
                        unselectedTextStyle:
                            AppTextStyles.robotoRegularBlack(14.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomButtonBlack(
                      buttonContent: registerProvider.isLoading
                          ? const CustomProgressIndicator(
                              color: AppColors.whiteColor,
                            )
                          : const Text('Continue'),
                      onPressed: registerProvider.isLoading
                          ? () {}
                          : () async {
                              if (_formKey.currentState!.validate()) {
                                /*  bool registered = await registerProvider.register(
                                  registerRequestModel: RegisterRequestModel(
                                      fullName: nameController.text,
                                      email: emailController.text,
                                      phoneNumber: phoneController.text,
                                      password: passwordController.text,
                                      groupId: '2',
                                      type: 0)); */
                                bool userNotExisted =
                                    await registerProvider.checkUserExist(
                                        email: emailController.text);
                                if (userNotExisted) {
                                  if (registerProvider.userType ==
                                      UserType.business) {
                                    registerProvider
                                        .setUserRegisterCompanyAccountData(
                                            name: nameController.text,
                                            email: emailController.text,
                                            phone: phoneNumber.phoneNumber!,
                                            password: passwordController.text);
                                    RoutingProvider.pushNamed(
                                        routeName:
                                            Routes.businessUserAccountDetails);
                                  } else {
                                    bool otpSent =
                                        await registerProvider.sendOtp(
                                            phoneNumber:
                                                phoneNumber.phoneNumber!);
                                    if (otpSent) {
                                      registerProvider
                                          .setUserRegisterAccountData(
                                              name: nameController.text,
                                              email: emailController.text,
                                              phone: phoneNumber.phoneNumber!,
                                              password:
                                                  passwordController.text);
                                      if (registerProvider.userType ==
                                          UserType.user) {
                                        RoutingProvider.pushNamed(
                                            routeName:
                                                Routes.otpVerificationScreen);
                                      }
                                    }
                                  }
                                }
                              }
                            }),
                ),
                SizedBox(
                  height: 55.h,
                ),
                Text(
                  'Already have an account?',
                  style: AppTextStyles.header3Inter,
                ),
                SizedBox(
                  height: 10.h,
                ),
                InkWell(
                  onTap: () {
                    RoutingProvider.pushNamed(routeName: Routes.loginScreen);
                  },
                  child: Text(
                    'Log in',
                    style: AppTextStyles.header3Inter
                        .copyWith(color: AppColors.blueColor),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}
