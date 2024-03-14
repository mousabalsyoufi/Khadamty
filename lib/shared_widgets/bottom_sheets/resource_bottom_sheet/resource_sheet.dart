import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/resource_bottom_sheet/resource_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors/colors.dart';

class ResourceBottomSheetImp {

  static void showResourcePicker(BuildContext context) {
    // show what's choose you need [image , video, Gallery]
    showModalBottomSheet(
        backgroundColor: AppColors.transparentColor,
        context: context,
        builder: (BuildContext context){
      return  Container(
          height: 100.h,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.r))
          ),
          child: const ResourceBottomSheetView());
    });

  }


}