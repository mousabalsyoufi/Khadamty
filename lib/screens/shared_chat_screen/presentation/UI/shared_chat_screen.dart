import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/presentation/widgets/chat_text_field.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/chat_message_item.dart';

class SharedChatScreen extends StatelessWidget {
  const SharedChatScreen({super.key, required this.chatHistory});

  final bool chatHistory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('John Doe', actions: [
        if (!chatHistory)
          Padding(
            padding: EdgeInsetsDirectional.only(end: 20.w),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 35.r,
                height: 35.r,
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.phone,
                  color: AppColors.blackColor,
                  size: 20.r,
                ),
              ),
            ),
          ),
      ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(
            thickness: 2.h,
            color: AppColors.whiteColor,
            endIndent: 20.w,
            indent: 20.w,
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Today',
            style: AppTextStyles.robotoRegularBlack(12.sp),
          ),
          SizedBox(
            height: 15.h,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView.builder(
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      ChatMessageListItem(
                        sentMessageColor: chatHistory
                            ? AppColors.blackColor
                            : AppColors.blueColor,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  );
                }),
                reverse: true,
                itemCount: 3,
              ),
            ),
          ),
          // if it's history chat no need to show the send message field
          if (!chatHistory) const ChatTextField(),
        ],
      ),
    );
  }
}
