import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/enums/categories_type.dart';
import 'package:flutter/material.dart';

// service to provider some useful info related to Category service [ color , name]
class CategoryService {
   // function return a Color of category depended on category Type
  static Color getBasicColor(CategoryType categoryType) {
    if (categoryType == CategoryType.family) {
      return AppColors.orangeColor;
    } else if (categoryType == CategoryType.courses) {
      return AppColors.yellowColor;
    } else if (categoryType == CategoryType.home) {
      return AppColors.blueColor;
    } else if (categoryType == CategoryType.outSide) {
      return AppColors.greenColor;
    } else if (categoryType == CategoryType.offers) {
      return AppColors.blackColor;
    }
    return AppColors.whiteColor;
  }
  // function return a String as name of category depended on category Type
  static String getCategoryName(CategoryType categoryType) {
    if (categoryType == CategoryType.family) {
      return "Family";
    } else if (categoryType == CategoryType.courses) {
      return "Courses";
    } else if (categoryType == CategoryType.home) {
      return "Home";
    } else if (categoryType == CategoryType.outSide) {
      return "OutSide";
    } else if (categoryType == CategoryType.offers) {
      return "Offers";
    }
    return "undefined";
  }
}
