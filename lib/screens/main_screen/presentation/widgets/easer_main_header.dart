import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/local_storage/storage_manager.dart';
import '../../../../shared_widgets/circle_container_with_name.dart';
import '../../../../shared_widgets/circle_image_file_with_border.dart';
import '../../../../shared_widgets/custom_notification_button.dart';
import '../../business_logic/provider/main_provider.dart';

// ease main header
class EaserMainHeader extends StatelessWidget {
  const EaserMainHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? photo = StorageManager.getUserPhoto();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                Provider.of<MainProvider>(context, listen: false)
                    .changeActiveScreen(3);
              },
              child: photo == null || photo.isEmpty
                  ? CircleContainerWithName(
                      name: StorageManager.getFullName()!,
                      width: 35.h,
                      height: 35.h,
                    )
                  : CircleImageFileWithBorder(
                      photoFile: photo, width: 35.h, height: 35.h)
              /* Stack(
              children: [
                Container(
                  width: 97.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "08:56",
                          style: AppTextStyles.header4Inter,
                        )),
                  ),
                ),
                CircleImageWithBorder(
                  url: 'https://freepngimg.com/thumb/man/10-man-png-image.png',
                  width: 35.h,
                  height: 35.h,
                ),
              ],
            ), */
              ),
          const Spacer(),
          /*  const CustomLocationPickerButton(
            cityName: 'City',
          ),
          SizedBox(
            width: 10.w,
          ), */
          const NotificationIconButton(
            count: 12,
          ),
        ],
      ),
    );
  }
}
