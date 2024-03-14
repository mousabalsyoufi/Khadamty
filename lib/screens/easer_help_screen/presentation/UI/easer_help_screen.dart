import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/screens/easer_help_screen/business_logic/provider/easer_help_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:faciltateur_de_vies/shared_widgets/faq_card_widget.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_button_black.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../routes/routes_names/routes_names.dart';
import '../../../../routes/routes_provider/routes_provider.dart';
import '../widgets/chat_card_widget.dart';

class EaserHelpScreen extends StatefulWidget {
  const EaserHelpScreen({Key? key}) : super(key: key);

  @override
  State<EaserHelpScreen> createState() => _EaserHelpScreenState();
}

class _EaserHelpScreenState extends State<EaserHelpScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<EaserHelpProvider>(context, listen: false).getEaserFaqs();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Consumer<EaserHelpProvider>(builder: (context, provider, _) {
          if (provider.isLoading) {
            return const CustomProgressIndicator(color: AppColors.blackColor);
          } else if (provider.faqs.isNotEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                const ChatContactCardWidget(count: 2),
                SizedBox(
                  height: 20.h,
                ),
                CustomButtonBlack(
                    buttonContent: const Text("Start Chat"),
                    onPressed: () {
                      // argument is to determain if it's chat history
                      RoutingProvider.pushNamed(
                          routeName: Routes.sharedChatScreen, arguments: false);
                    }),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "FAQ",
                  style: AppTextStyles.header2Inter,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: provider.faqs.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return FAQCard(faqModel: provider.faqs[index]);
                      }),
                )
              ],
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
