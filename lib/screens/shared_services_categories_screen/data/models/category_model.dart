import 'package:faciltateur_de_vies/constants/enums/categories_type.dart';
import 'package:faciltateur_de_vies/services/category_services.dart';
import 'package:flutter/material.dart';

class Category {
  final Color color;
  final String title;
  final CategoryType categoryType;
  Category({required this.title,required this.color,required this.categoryType});
}


List<Category> categories = [
  Category(color: CategoryService.getBasicColor(CategoryType.home)  ,title: 'Home',categoryType:CategoryType.home ),
  Category(color: CategoryService.getBasicColor(CategoryType.family) ,title: 'Family',categoryType: CategoryType.family),
  Category(color:CategoryService.getBasicColor(CategoryType.courses)  ,title: 'Courses',categoryType: CategoryType.courses),
  Category(color:CategoryService.getBasicColor(CategoryType.outSide)  ,title: 'OutSide',categoryType: CategoryType.outSide),
  Category(color:CategoryService.getBasicColor(CategoryType.offers)  ,title: 'Offers',categoryType:CategoryType.offers ),
];