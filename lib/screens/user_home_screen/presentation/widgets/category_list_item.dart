import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/screens/main_screen/business_logic/provider/main_provider.dart';
import 'package:faciltateur_de_vies/shared_models/category_model.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem(
      {Key? key, required this.categoryModel, required this.categoryIndex})
      : super(key: key);

  final CategoryModel categoryModel;
  final int categoryIndex;

  @override
  Widget build(BuildContext context) {
    Color cardColor = Utility.hexColor(categoryModel.color);
    return GestureDetector(
      onTap: () {
        Provider.of<MainProvider>(context, listen: false)
            .changeActiveScreen(1, categoryIndex);
      },
      child: Container(
        padding: EdgeInsets.all(5.r),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(5.r)),
        child: Row(
          children: [
            Container(
              width: 50.w,
              height: 70.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  border: Border.all(
                    width: 3,
                    color: cardColor,
                  )),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(2.r),
                  child: CustomNetworkImage(
                    imageUrl:
                        'https://picsum.photos/50/70?random=${categoryModel.id}',
                    /*  categoryModel.photo.isNotEmpty
                        ? Urls.baseUrl + categoryModel.photo[0].fullname
                        : 'https://picsum.photos/50/70?random=${categoryModel.id}', */
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: 15.w,
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 12.w,
                    height: 3.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: cardColor,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Flexible(
                      child: Text(
                    categoryModel.label,
                    style: AppTextStyles.robotoMediumBlack,
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
