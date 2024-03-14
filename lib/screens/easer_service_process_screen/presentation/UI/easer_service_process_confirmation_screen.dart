// This is last screen in Easer Report Flow "Confirmation Report"
import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_styles/text_styles.dart';
import '../../../../shared_widgets/custom_network_image.dart';
import '../../../../shared_widgets/photos_view_dialog.dart';


// This is Screen for " Easer Confirmation Screen " The 3th Screen in Report flow
class EaserConfirmationServiceProcessScreen extends StatelessWidget {
  EaserConfirmationServiceProcessScreen({Key? key}) : super(key: key);
   // dummy image List
  final List<String> images = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  ];
  @override
  Widget build(BuildContext context) {
    // add Column here to avoid expanded long screen in up level
    return Column(
      children: [
        Container(
          height: 214.h,
          width: 320.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            color: AppColors.whiteColor,
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("No Report",style: AppTextStyles.header4Inter),
                SizedBox(height: 20.h,),
                Text("Final debriefing",style: AppTextStyles.header4Inter),
                SizedBox(height: 15.h,),
                Text("Everything went well",style: AppTextStyles.header4Inter),
                SizedBox(height: 15.h,),
                Row(
                  mainAxisAlignment: images.length > 2
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.start,
                  children: images
                      .map((image) => Padding(
                    padding: EdgeInsetsDirectional.only(
                        end: images.length > 2 ? 0.0 : 15.w),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => PhotosViewDialog(
                              photos: images,
                              currentIndex: images.indexOf(image)),
                        );
                      },
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.r),
                          child: CustomNetworkImage(
                            imageUrl: image,
                            width: 85.r,
                            height: 85.r,
                            fit: BoxFit.cover,
                          )),
                    ),
                  ))
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
