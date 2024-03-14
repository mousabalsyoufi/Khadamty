import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/data/models/service_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors/colors.dart';
import '../../../constants/text_styles/text_styles.dart';

class ServiceTasksEditWidget extends StatelessWidget {
  const ServiceTasksEditWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: services.length,
        itemBuilder: (BuildContext context, int index) {
          ServiceModel item = services[index];
          return Padding(
            padding: EdgeInsetsDirectional.only(bottom: 15.h),
            child: Container(
              height: 45.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  color: AppColors.grey10Color),
              child: InkWell(
                onTap: (){
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: item.isSelected,
                      activeColor: AppColors.blackColor,
                      checkColor: AppColors.greenColor,
                      onChanged: (bool? value) {
                      },
                    ),
                    Text(
                      item.title,
                      maxLines: 2,
                      style: AppTextStyles.header4Inter,
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 10.w,
                    ),
                    if (item.isSelected)
                      Text(
                        "${item.totalNumberSelectedTasks}/${item.totalNumberTasks}",style: AppTextStyles.header4Inter,),
                    if (item.isSelected)
                      SizedBox(
                        width: 10.w,
                      ),
                    Icon(Icons.arrow_forward,size: 18.r),
                    SizedBox(
                      width: 5.w,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}