import 'dart:convert';

import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/enums/user_type.dart';
import 'package:faciltateur_de_vies/constants/icons/icons.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/core/local_storage/storage_manager.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/screens/main_screen/business_logic/provider/main_provider.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/business_logic/provider/user_profile_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/custom_sheets/custom_sheets.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_list_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../routes/routes_names/routes_names.dart';
import '../../../../shared_widgets/circle_container_with_name.dart';
import '../../../../shared_models/profile_model.dart';
import '../../../../shared_widgets/circle_image_file_with_border.dart';
import '../../../../shared_widgets/custom_badge_edit.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool subscribed = StorageManager.getUserType() == UserType.subscribedUser;
    List profileOptions =
        subscribed ? subscribedUserProfileOptions : userProfileOptions;
    var mainProvider = Provider.of<MainProvider>(context, listen: false);
    return Consumer<UserProfileProvider>(
        builder: (BuildContext context, userProvider, child) {
      String? photo = StorageManager.getUserPhoto();
      return Scaffold(
        body: Column(
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  itemCount: profileOptions.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    ProfileOptionModel option = profileOptions[index];
                    return CustomListTileCardWidget(
                      isLastItem: index == profileOptions.length,
                      onPress: () {
                        if (option.screenName == Routes.loginScreen) {
                          RoutingProvider.pushNamedAndRemoveAllBack(
                              routeName: option.screenName);
                          /*  Provider.of<MainProvider>(context, listen: false)
                              .changeActiveScreen(0); */
                          StorageManager.removeUserData();
                        } else if (option.screenName == 'delete_account') {
                          CustomSheets.showIconTextTwoButtonColumnBottomSheet(
                              context: context,
                              iconPath: AppIcons.stopIcon,
                              contentText:
                                  'Are you sure to delete your account ?',
                              acceptButtonText: 'Delete account',
                              rejectButtonText: 'Cancel',
                              acceptButtonColor: AppColors.blackColor,
                              rejectButtonColor: AppColors.whiteColor,
                              acceptButtonTapFunction: () async {
                                bool deleted =
                                    await Provider.of<UserProfileProvider>(
                                            context,
                                            listen: false)
                                        .deleteUserAccount(
                                            id: StorageManager.getUserId());
                                if (deleted) {
                                  StorageManager.removeUserData();
                                  RoutingProvider.pushNamedAndRemoveAllBack(
                                      routeName: Routes.loginScreen);
                                }
                              },
                              rejectButtonTapFunction: () {
                                RoutingProvider.goBack();
                              },
                              acceptButtonStyle: AppTextStyles.robotoMediumWhite
                                  .copyWith(fontSize: 16.sp),
                              rejectButtonStyle: AppTextStyles.robotoMediumBlack
                                  .copyWith(fontSize: 16.sp),
                              borderColor: AppColors.blackColor);
                        } else {
                          RoutingProvider.pushNamed(
                              routeName: option.screenName);
                        }
                      },
                      title: option.title,
                      trailingIcon: option.isTrailingIcon,
                      iconName: option.iconName,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
