import 'dart:io';

import 'package:faciltateur_de_vies/core/extensions/date_extensions.dart';
import 'package:faciltateur_de_vies/core/helpers/date_helper.dart';
import 'package:faciltateur_de_vies/core/local_storage/storage_manager.dart';
import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/screens/main_screen/business_logic/provider/main_provider.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/business_logic/provider/user_profile_provider.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/account_model.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/calendar_bottom_sheet/calendar_bottom.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../core/utility/custom_validator.dart';
import '../../../../shared_widgets/custom_appbar.dart';
import '../../../../shared_widgets/custom_button_black.dart';
import '../../../../shared_widgets/custom_input_text.dart';
import '../../../../shared_widgets/phone_number_picker_field.dart';

class UserPersonalDataScreen extends StatefulWidget {
  const UserPersonalDataScreen({super.key});

  @override
  State<UserPersonalDataScreen> createState() => _UserPersonalDataScreenState();
}

class _UserPersonalDataScreenState extends State<UserPersonalDataScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  AccountModel model = AccountModel();

  final String initialCountry = 'FR';
  PhoneNumber? number;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserProfileProvider>(context, listen: false).getAccount();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: customAppBar('Personal data'),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.all(20.r),
            child: Selector<UserProfileProvider, bool>(
                selector: (BuildContext context, value) =>
                    value.isLoadingUpdate,
                builder: (context, value, child) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: CustomButtonBlack(
                        onPressed: !value
                            ? () async {
                                if (_formKey.currentState!.validate()) {
                                  // user id ;
                                  int id =
                                      int.parse(StorageManager.getUserId());
                                  int timestamp = dateTimeStamp();

                                  AccountModel newRow = AccountModel(
                                      user_mobile: number!.phoneNumber,
                                      birth: timestamp.toString(),
                                      lastname: fullNameController.text,
                                      email: emailController.text);

                                  bool isSameValues = model.equals(newRow);
                                  bool isEmpty = newRow.isEmpty();
                                  if (timestamp == -1) {
                                    Utility.showToast(
                                        message:
                                            "please check the date if valid or not");
                                  } else {
                                    if (!isEmpty && !isSameValues) {
                                      model = newRow;
                                      AccountModel? isUpdatedMessage =
                                          await Provider.of<
                                                      UserProfileProvider>(
                                                  context,
                                                  listen: false)
                                              .updateAccount(
                                                  id: id, accountModel: newRow);
                                      if (isUpdatedMessage != null) {
                                        StorageManager.setFullName(
                                            newRow.lastname!);
                                        StorageManager.setEmail(newRow.email!);
                                        Provider.of<MainProvider>(context,
                                                listen: false)
                                            .updateUi();
                                        Utility.showToast(
                                            message: "Updated successfully");
                                      }
                                    } else {
                                      Utility.showToast(
                                          message: "No changes to update");
                                    }
                                  }
                                }
                              }
                            : () {},
                        buttonContent: value
                            ? SizedBox(
                                height: 30.h,
                                child: const CustomProgressIndicator(
                                  color: AppColors.whiteColor,
                                ),
                              )
                            : const Text('Save changes'),
                      ),
                    ))),
        body: Selector<UserProfileProvider, bool>(
            selector: (BuildContext context, value) => value.isLoading,
            builder: (context, value, child) {
              AccountModel? account =
                  Provider.of<UserProfileProvider>(context, listen: false)
                      .account;
              if (value) {
                return const CustomProgressIndicator(
                    color: AppColors.blackColor);
              } else if (account != null) {
                number = PhoneNumber(
                    isoCode: PhoneNumber.getISO2CodeByPrefix(
                        getCodeNumber(account.user_mobile)),
                    phoneNumber: getNumber(account.user_mobile));
                model = initData(account);
                return Form(
                  key: _formKey,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(5.r)),
                    padding: EdgeInsets.all(20.r),
                    child: SingleChildScrollView(
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
                            enableField: value ? false : true,
                            controller: fullNameController
                              ..text = account.lastname!,
                            fillColor: AppColors.grey10Color,
                            hint: 'full name',
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp("[a-z A-Z]")),
                            ],
                            textInputAction: TextInputAction.next,
                            hintStyle: AppTextStyles.robotoRegularGrey50
                                .copyWith(fontSize: 14.sp),
                            onValid: (value) =>
                                CustomValidator.isRequired(value),
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
                            enableField: false,
                            controller: emailController..text = account.email!,
                            fillColor: AppColors.whiteColor,
                            hint: 'email',
                            borderColor: AppColors.grey10Color,
                            textInputAction: TextInputAction.next,
                            hintStyle: AppTextStyles.robotoRegularGrey50
                                .copyWith(
                                    fontSize: 14.sp,
                                    color: AppColors.grey50Color),
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
                          SizedBox(
                            height: 50.h,
                            child: PhoneNumberField(
                              number: Platform.isAndroid
                                  ? number!
                                  : PhoneNumber(
                                      isoCode: PhoneNumber.getISO2CodeByPrefix(
                                          getCodeNumber(account.user_mobile))),
                              enabled: false,
                              textColor: AppColors.grey60Color,
                              updatePhoneNumber: (PhoneNumber phone) {
                                number = phone;
                              },
                              controller: phoneController
                                ..text = getNumber(account.user_mobile!),
                              fillColor: AppColors.whiteColor,
                              hintTextStyle: AppTextStyles.robotoRegularGrey50
                                  .copyWith(fontSize: 14.sp),
                              inputBorderColor: AppColors.grey10Color,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "Date of birth",
                            style: AppTextStyles.robotoBoldBlack(12.sp),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          InkWell(
                            onTap: () {
                              var dateToday = DateTime.now();
                              String date = account.birth.toString() == ''
                                  ? DateTime(dateToday.year - 18,
                                          dateToday.month + 1, dateToday.day)
                                      .millisecondsSinceEpoch
                                      .toString()
                                      .substring(0, 10)
                                  : account.birth.toString();
                              CalendarBottomSheet.showCalendarYearsDialog(
                                  context,
                                  selectedDate: DateHelper.dateFromTimeStamp(
                                      int.parse(date)),
                                  onSelectionChanged:
                                      (DateRangePickerSelectionChangedArgs
                                          yearArgs) {
                                if (yearArgs.value != null) {
                                  RoutingProvider.goBack();
                                  CalendarBottomSheet
                                      .showCalendarMonthsDialogExtend(
                                    context,
                                    allowYearsChange: false,
                                    selectedDate: yearArgs.value,
                                    onSelectionChanged:
                                        (DateRangePickerSelectionChangedArgs
                                            monthArgs) {
                                      if (monthArgs.value != null) {
                                        RoutingProvider.goBack();
                                        CalendarBottomSheet
                                            .showCalendarDaysDottedDialogExtents(
                                                context, monthArgs.value,
                                                (DateTime date) {
                                          birthdayController.text =
                                              date.yyyyMMdd();
                                        });
                                      }
                                    },
                                  );
                                }
                              });
                            },
                            child: AbsorbPointer(
                              absorbing: true,
                              child: CustomTextField(
                                enableField: false,
                                controller: birthdayController
                                  ..text = account.birth.toString() != ''
                                      ? DateHelper.dateFromTimeStamp(int.parse(
                                              account.birth.toString()))
                                          .toLocal()
                                          .yyyyMMdd()
                                      : "",
                                fillColor: AppColors.grey10Color,
                                hint: 'YYYY-MM-DD',
                                hintStyle: AppTextStyles.robotoRegularGrey50
                                    .copyWith(fontSize: 14.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return Container();
            }),
      ),
    );
  }

  String getCodeNumber(String? phoneNumber) {
    if (phoneNumber != null && phoneNumber.length > 8) {
      return phoneNumber.substring(0, phoneNumber.length - 9);
    }
    return "+33";
  }

  String getNumber(String? phoneNumber) {
    if (phoneNumber != null && phoneNumber.length > 8) {
      return phoneNumber.substring(
        phoneNumber.length - 9,
      );
    }
    return phoneNumber!;
  }

  // store data before user edit them
  AccountModel initData(AccountModel prevData) {
    return AccountModel(
        user_mobile: prevData.user_mobile,
        birth: prevData.birth,
        lastname: prevData.lastname,
        email: prevData.email);
  }

  int dateTimeStamp() {
    try {
      var dateTime = DateTime.parse(
        birthdayController.text.trim(),
      );

      int timestamp = 0;
      if (dateTime.year > 2001) {
        timestamp = int.parse(
            dateTime.millisecondsSinceEpoch.toString().substring(0, 10));
      } else {
        timestamp = int.parse(
            dateTime.millisecondsSinceEpoch.toString().substring(0, 9));
      }

      return timestamp;
    } catch (e) {
      return -1;
    }
  }
}
