import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/routes/routes_names/routes_names.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// notification icon button (header appbar)
class NotificationIconButton extends StatelessWidget {
  final int count;
  const NotificationIconButton({Key? key, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RoutingProvider.pushNamed(routeName: Routes.notificationsScreen);
      },
      child: Stack(
        children: [
          Container(
            height: 36.h,
            width: 36.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.whiteColor,
            ),
            child: const Icon(Icons.notifications_rounded),
          ),
          Positioned(
              top: 5.h,
              right: 6.w,
              child: Container(
                width: 10.r,
                height: 10.r,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.greenColor,
                ),
              )),
          /* Positioned(
              top: 5.h, right: 6.w, child: CustomBadgeCounter(count: count)), */
        ],
      ),
    );
  }
}
