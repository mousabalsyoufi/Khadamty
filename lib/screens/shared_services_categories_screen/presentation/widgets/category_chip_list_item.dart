import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/business_logic/provider/shared_services_categories_provider.dart';
import 'package:faciltateur_de_vies/shared_models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../constants/text_styles/text_styles.dart';

class CategoryChipListItem extends StatelessWidget {
  const CategoryChipListItem({
    Key? key,
    required this.isSelected,
    required this.category,
    required this.index,
  }) : super(key: key);
  final CategoryModel category;
  final bool isSelected;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<SharedServicesCategoriesProvider>(context, listen: false)
            .changeActiveCategory(index);
      },
      child: Chip(
        label: Text(
          category.label,
          style: isSelected
              ? AppTextStyles.header4Inter.copyWith(
                  color: category.color == '000000'
                      ? AppColors.whiteColor
                      : AppColors.blackColor)
              : AppTextStyles.header4InterGrey70,
        ),
        backgroundColor: isSelected
            ? Utility.hexColor(category.color)
            : AppColors.whiteColor,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 8.h,
        ),
      ),
    );
  }
}
