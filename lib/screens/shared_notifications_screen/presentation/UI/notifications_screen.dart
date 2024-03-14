import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/screens/shared_notifications_screen/presentation/Widgets/notification_list_item.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../shared_widgets/custom_appbar.dart';
import '../../business_logic/provider/notifications_provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<NotificationsProvider>(context, listen: false)
          .getNotifications();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Notifications'),
      body: Consumer<NotificationsProvider>(builder: (context, provider, _) {
        if (provider.isLoading) {
          return const CustomProgressIndicator(color: AppColors.blackColor);
        } else if (provider.notifications.isNotEmpty) {
          return Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ListView.builder(
                    itemBuilder: (context, index) => Column(
                      children: [
                        NotificationListItem(
                            notification: provider.notifications[index]),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                    shrinkWrap: true,
                    itemCount: provider.notifications.length,
                  ),
                ),
              ),
            ],
          );
        } else if (provider.notifications.isEmpty) {
          return Center(
            child: Text(
              'No Notifications',
              style: AppTextStyles.robotoBoldBlack(16.sp),
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
