import 'package:faciltateur_de_vies/constants/consts/consts.dart';
import 'package:faciltateur_de_vies/core/local_storage/storage_manager.dart';
import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/screens/shared_help_form_screen/business_logic/provider/shared_help_form_provider.dart';
import 'package:faciltateur_de_vies/screens/shared_help_form_screen/presentation/widgets/help_topic_bottom_sheet.dart';
import 'package:faciltateur_de_vies/shared_models/shared_help_ticket_request_model.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_appbar.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_button_black.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_input_text.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/text_styles/text_styles.dart';

class SharedHelpFormScreen extends StatefulWidget {
  const SharedHelpFormScreen({super.key});

  @override
  State<SharedHelpFormScreen> createState() => _SharedHelpFormScreenState();
}

class _SharedHelpFormScreenState extends State<SharedHelpFormScreen> {
  final TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SharedHelpFormProvider>(builder: (context, provider, _) {
      return Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(20.r),
          child: CustomButtonBlack(
              buttonContent: provider.isLoading
                  ? SizedBox(
                      height: 47.h,
                      child: const CustomProgressIndicator(
                          color: AppColors.whiteColor),
                    )
                  : const Text('Send'),
              onPressed: provider.isLoading
                  ? () {}
                  : () async {
                      if (provider.helpTicketType.isEmpty ||
                          messageController.text.isEmpty) {
                        Utility.showToast(
                            message: 'please fill the fields of the ticket');
                      } else {
                        int ticketId = await provider.sendHelpTicket(
                            requestModel: SharedHelpTicketRequestModel(
                                fkSoc: StorageManager.getUserSocId(),
                                subject: provider.helpTicketType,
                                message: messageController.text,
                                typeCode: Consts.comTicket,
                                categoryCode: Consts.otherCategoryCodeTicket,
                                severityCode: Consts.normalSeverityTicket));
                        if (ticketId > 0) {
                          messageController.clear();
                        }
                      }
                    }),
        ),
        appBar: customAppBar('Help form'),
        body: Padding(
          padding: EdgeInsets.all(20.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Topic',
                  style: AppTextStyles.header3Inter,
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: AppColors.transparentColor,
                      builder: (context) => const HelpTopicBottomSheet(),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Row(
                      children: [
                        Text(
                          provider.helpTicketType.isEmpty
                              ? 'Select topic'
                              : provider.helpTicketType,
                          style: AppTextStyles.header4Inter,
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward,
                          color: AppColors.blackColor,
                          size: 15.r,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Message',
                  style: AppTextStyles.header3Inter,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextField(
                  controller: messageController,
                  maxCharacters: 280,
                  prefix: SizedBox(width: 5.w),
                  hint: 'Let us know your problem here',
                  hintStyle: AppTextStyles.robotoRegularGrey50
                      .copyWith(fontSize: 12.sp),
                  textType: TextInputType.multiline,
                  minLines: 8,
                ),
                // const Spacer(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
