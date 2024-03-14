import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


AppBar customAppBar(String title,{List<Widget>? actions}) => AppBar(
      backgroundColor: AppColors.greyColor,
      elevation: 0,
      titleSpacing: 20.w,
      leadingWidth: 0,
      leading:const SizedBox(),
      actions: actions,
      title: Row(
        children: [
          const CustomBackButton(),
          SizedBox(width: 10.w,),
          Text(title,style: AppTextStyles.header3Inter,),
        ],
      ),
);