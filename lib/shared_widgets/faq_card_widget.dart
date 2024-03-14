import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/shared_models/shared_faq_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class FAQCard extends StatelessWidget {
  final SharedFaqModel faqModel;
  const FAQCard({Key? key, required this.faqModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsetsDirectional.only(bottom: 20.h),
      child: ExpansionTile(
        iconColor: AppColors.blackColor,
        title: HtmlWidget(
          faqModel.label,
          textStyle: AppTextStyles.robotoBoldBlack(12.sp),
        ),
        /* Text(faqModel.label, style: AppTextStyles.robotoBoldBlack(12.sp)), */
        children: <Widget>[
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: 20.w, end: 20.w, bottom: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  height: 1.h,
                ),
                SizedBox(
                  height: 15.h,
                ),
                HtmlWidget(
                  faqModel.description,
                  textStyle: AppTextStyles.paragraph3Roboto
                      .copyWith(color: AppColors.blackColor),
                ),
                /* Text(
                  faqModel.description,
                  style: AppTextStyles.paragraph3Roboto
                      .copyWith(color: AppColors.blackColor),
                ), */
              ],
            ),
          )
        ],
      ),
    );
  }
}
