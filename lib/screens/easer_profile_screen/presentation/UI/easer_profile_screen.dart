import 'dart:convert';

import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/business_logic/provider/user_profile_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_list_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../core/local_storage/storage_manager.dart';
import '../../../../routes/routes_names/routes_names.dart';
import '../../../../routes/routes_provider/routes_provider.dart';
import '../../../../shared_widgets/circle_container_with_name.dart';
import '../../../../shared_models/profile_model.dart';
import '../../../../shared_widgets/circle_image_file_with_border.dart';
import '../../../../shared_widgets/custom_badge_edit.dart';
import '../../../main_screen/business_logic/provider/main_provider.dart';

class EaserProfileScreen extends StatelessWidget {
  const EaserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mainProvider = Provider.of<MainProvider>(context, listen: false);
    return Scaffold(
      body: Consumer<UserProfileProvider>(builder: (context, userProvider, _) {
        String? photo = StorageManager.getUserPhoto();
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Stack(
              children: [
                photo == null || photo.isEmpty
                    ? CircleContainerWithName(
                        name: StorageManager.getFullName()!,
                        width: 65.h,
                        height: 65.h,
                        borderColor: AppColors.greenColor,
                        borderWidth: 3.r,
                        fontSize: 20,
                      )
                    : CircleImageFileWithBorder(
                        photoFile: photo, width: 65.h, height: 65.h),
                Positioned(
                    bottom: 0.h,
                    right: 0.w,
                    child: CustomBadgeEdit(
                      onPress: () async {
                        final ImagePicker picker = ImagePicker();
                        // Pick an image
                        final XFile? image =
                            await picker.pickImage(source: ImageSource.gallery);
                        if (image != null) {
                          var imageBytes = await image.readAsBytes();
                          String encodedImage = base64Encode(imageBytes);
                          StorageManager.setUserPhoto(encodedImage);
                          userProvider.uploadPhoto(photo: encodedImage);
                          mainProvider.updateUi();
                        }
                      },
                    )),
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
            Text(
              StorageManager.getFullName()!,
              style: AppTextStyles.paragraphRobotoMedium,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              StorageManager.getEmail()!,
              style: AppTextStyles.paragraph3Roboto,
            ),
            SizedBox(
              height: 21.h,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: easerProfileOptions.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemBuilder: (BuildContext context, int index) {
                  ProfileOptionModel option = easerProfileOptions[index];
                  return CustomListTileCardWidget(
                    isLastItem: index == easerProfileOptions.length,
                    onPress: () {
                      if (option.screenName == Routes.loginScreen) {
                        RoutingProvider.pushNamedAndRemoveAllBack(
                            routeName: option.screenName);
                        /* Provider.of<MainProvider>(context, listen: false)
                              .changeActiveScreen(0); */
                        StorageManager.removeUserData();
                      } else {
                        RoutingProvider.pushNamed(routeName: option.screenName);
                      }
                    },
                    title: option.title,
                    trailingIcon: option.isTrailingIcon,
                    iconName: option.iconName,
                  );
                },
              ),
            )
          ],
        );
      }),
    );
  }
}
