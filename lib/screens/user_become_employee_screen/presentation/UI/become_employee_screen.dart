import 'package:faciltateur_de_vies/constants/consts/consts.dart';
import 'package:faciltateur_de_vies/core/local_storage/storage_manager.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/screens/user_become_employee_screen/business_logic/provider/become_an_employee_provider.dart';
import 'package:faciltateur_de_vies/shared_models/shared_help_ticket_request_model.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_appbar.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:faciltateur_de_vies/shared_widgets/phone_number_picker_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../core/utility/custom_validator.dart';
import '../../../../shared_widgets/custom_button_black.dart';
import '../../../../shared_widgets/custom_input_text.dart';

// ignore: must_be_immutable
class UserBecomeEmployeeScreen extends StatefulWidget {
  const UserBecomeEmployeeScreen({super.key});

  @override
  State<UserBecomeEmployeeScreen> createState() =>
      _UserBecomeEmployeeScreenState();
}

class _UserBecomeEmployeeScreenState extends State<UserBecomeEmployeeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController positionController = TextEditingController();

  final String initialCountry = 'FR';

  PhoneNumber number = PhoneNumber(isoCode: 'FR', phoneNumber: "");

  @override
  void dispose() {
    phoneController.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    positionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BecomeAnEmployeeProvider>(builder: (context, provider, _) {
        return Scaffold(
          appBar: customAppBar('Become an employee'),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(20.r),
            child: CustomButtonBlack(
              onPressed: provider.isLoading
                  ? () {}
                  : () async {
                      if (_formKey.currentState!.validate()) {
                        int ticketId = await provider.becomeAnEmployee(
                            requestModel: SharedHelpTicketRequestModel(
                                fkSoc: StorageManager.getUserSocId(),
                                subject: 'Become An Employee Request',
                                message:
                                    '${firstNameController.text} ${lastNameController.text}'
                                    '\n'
                                    '${emailController.text} '
                                    '\n'
                                    '${number.phoneNumber}'
                                    '\n'
                                    '${positionController.text}',
                                typeCode: Consts.comTicket,
                                categoryCode: Consts.otherCategoryCodeTicket,
                                severityCode: Consts.normalSeverityTicket));
                        if (ticketId != 0) {
                          RoutingProvider.goBack();
                        }
                      }
                    },
              buttonContent: provider.isLoading
                  ? SizedBox(
                      height: 47.h,
                      child: const CustomProgressIndicator(
                          color: AppColors.whiteColor))
                  : const Text('Send'),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsetsDirectional.only(end: 20.w, start: 20.w, top: 29.h),
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
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "First name",
                                style: AppTextStyles.robotoBoldBlack(12.sp),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                width: 135.w,
                                child: CustomTextField(
                                  controller: firstNameController,
                                  textInputAction: TextInputAction.next,
                                  fillColor: AppColors.grey10Color,
                                  hint: 'first name',
                                  hintStyle: AppTextStyles.robotoRegularGrey50
                                      .copyWith(fontSize: 14.sp),
                                  onValid: (value) =>
                                      CustomValidator.isRequired(value),
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
                              Text(
                                "Last name",
                                style: AppTextStyles.robotoBoldBlack(12.sp),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                width: 135.w,
                                child: CustomTextField(
                                  controller: lastNameController,
                                  fillColor: AppColors.grey10Color,
                                  hint: 'last name',
                                  textInputAction: TextInputAction.next,
                                  hintStyle: AppTextStyles.robotoRegularGrey50
                                      .copyWith(fontSize: 14.sp),
                                  onValid: (value) =>
                                      CustomValidator.isRequired(value),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Email",
                        style: AppTextStyles.robotoBoldBlack(12.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        controller: emailController,
                        fillColor: AppColors.grey10Color,
                        hint: 'email',
                        textInputAction: TextInputAction.next,
                        hintStyle: AppTextStyles.robotoRegularGrey50
                            .copyWith(fontSize: 14.sp),
                        onValid: (value) =>
                            CustomValidator.validateEmail(value),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Mobile",
                        style: AppTextStyles.robotoBoldBlack(12.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      PhoneNumberField(
                        number: number,
                        controller: phoneController,
                        fillColor: AppColors.grey10Color,
                        hintTextStyle: AppTextStyles.robotoRegularGrey50
                            .copyWith(fontSize: 14.sp),
                        inputBorderColor: AppColors.transparentColor,
                        updatePhoneNumber: ((phone) {
                          number = phone;
                        }),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Type of position",
                        style: AppTextStyles.robotoBoldBlack(12.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        controller: positionController,
                        fillColor: AppColors.grey10Color,
                        hint: 'indicate the position',
                        hintStyle: AppTextStyles.robotoRegularGrey50
                            .copyWith(fontSize: 14.sp),
                        onValid: (value) => CustomValidator.isRequired(value),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'You can send your CV and a cover letter to the following e-mail address: Je.souhaite.devenir@facilitateurdevies.com',
                        style: AppTextStyles.robotoRegularBlack(12.sp)
                            .copyWith(height: 1.5.h),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
