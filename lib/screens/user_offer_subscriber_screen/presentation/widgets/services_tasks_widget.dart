import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/screens/shared_offer_details_screen/data/model/offer_details_model.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/business_logic/provider/user_offer_subscriber_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../constants/text_styles/text_styles.dart';
import '../../../../shared_widgets/bottom_sheets/offer_service_included_tasks_bottom_sheet/offer_service_tasks_sheet.dart';

class ServiceTasksWidget extends StatelessWidget {
  const ServiceTasksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserOfferSubscriberProvider provider =
        Provider.of<UserOfferSubscriberProvider>(context, listen: true);

    return SizedBox(
      height: 280.h,
      child: provider.offerServices.isEmpty
          ? const Center(
              child: Text(
                  'sorry there is no tasks for the selected offer please try again later',
                  textAlign: TextAlign.center,),
            )
          : ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: provider.offerServices.length,
              itemBuilder: (BuildContext context, int index) {
                OfferProduct item = provider.offerServices[index];
                return Padding(
                  padding: EdgeInsetsDirectional.only(bottom: 15.h),
                  child: Container(
                    height: 45.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                        color: AppColors.whiteColor),
                    child: InkWell(
                      onTap: () {
                        OfferServiceTasksIncludedBottomSheet
                            .showOfferServiceTasks(
                                context, index, item.label, item.tasks);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: item.isSelected,
                            activeColor: AppColors.blackColor,
                            checkColor: AppColors.greenColor,
                            onChanged: (bool? value) {
                              provider.setAllServiceTasksActive(index, value!);
                            },
                          ),
                          Text(
                            item.label,
                            maxLines: 2,
                            style: AppTextStyles.header4Inter,
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 10.w,
                          ),
                          if (item.isSelected)
                            Text(
                              "${item.tasks.where((element) => element.isSelected).length}/${item.tasks.length}",
                              style: AppTextStyles.header4Inter,
                            ),
                          if (item.isSelected)
                            SizedBox(
                              width: 10.w,
                            ),
                          Icon(Icons.arrow_forward, size: 18.r),
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
