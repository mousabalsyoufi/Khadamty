import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// This Widget to upload or take resource from client Device
class UploadPhotoWidget extends StatelessWidget {
  final Function onTap;
  final Color backgroundColor;
  const UploadPhotoWidget({Key? key,required this.onTap,this.backgroundColor=AppColors.greyColor}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        height: 85.h,
        width: 85.w,
        decoration:BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(5.r)
        ),
        child: InkWell(
          onTap:() =>onTap(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Icon(Icons.camera_alt_outlined),
              Text("Add",style: AppTextStyles.paragraph3Roboto,),
            ],
          ),
        ));
  }
}
