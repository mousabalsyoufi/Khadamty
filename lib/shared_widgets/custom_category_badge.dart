import 'package:faciltateur_de_vies/constants/enums/categories_type.dart';
import 'package:faciltateur_de_vies/services/category_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../constants/colors/colors.dart';
import '../constants/text_styles/text_styles.dart';

@Deprecated("@Emadelddin This is class is Deprecated please use this class 'CustomCategoryBadgeExtended' instanced with 2 required parameter one to choose color and another to label")
class CustomCategoryBadge extends StatelessWidget {
   final CategoryType categoryType ;
   const CustomCategoryBadge({Key? key,required this.categoryType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(vertical:6.h,horizontal: 8.w),
      decoration: BoxDecoration(
          color: CategoryService.getBasicColor(categoryType),
          borderRadius: BorderRadius.all(Radius.circular(13.r),)
      ),
      child: Text(CategoryService.getCategoryName(categoryType),style: AppTextStyles.header4Inter.copyWith(
          color: categoryType == CategoryType.offers ? AppColors.whiteColor:AppColors.blackColor
      ),),
    );
  }
}
// TODO Later replace with id of category instance of compare the color :}
class CustomCategoryBadgeExtended extends StatelessWidget {
  final Color color ;
  final String label;
  const CustomCategoryBadgeExtended({Key? key,required this.color,required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(vertical:6.h,horizontal: 8.w),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(13.r),)
      ),
      child: Text(label,style: AppTextStyles.header4Inter.copyWith(
          color: color == AppColors.blackColor  ? AppColors.whiteColor:AppColors.blackColor
      ))
    );
  }
}
