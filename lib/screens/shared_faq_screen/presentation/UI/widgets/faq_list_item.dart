import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/shared_models/shared_faq_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class FaqListItem extends StatelessWidget {
  const FaqListItem({super.key, required this.faqModel});

  final SharedFaqModel faqModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Row(
        children: [
          HtmlWidget(
            faqModel.label,
            textStyle: AppTextStyles.header4Inter,
          ),
          //Text(faqModel.label, style: AppTextStyles.header4Inter,),
          const Spacer(),
          Icon(
            Icons.arrow_forward,
            color: AppColors.blackColor,
            size: 15.r,
          )
        ],
      ),
    );
  }
}
