import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/shared_models/category_service_model.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/enums/user_type.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../core/local_storage/storage_manager.dart';
import '../../../../routes/routes_names/routes_names.dart';
import '../../../../routes/routes_provider/routes_provider.dart';

class ServiceListItem extends StatelessWidget {
  const ServiceListItem({Key? key, required this.service, required this.color})
      : super(key: key);

  final CategoryServiceModel service;
  final String color;

  @override
  Widget build(BuildContext context) {
    UserType userType = StorageManager.getUserType();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          service.label,
          style: AppTextStyles.header2Inter,
        ),
        SizedBox(
          height: 10.h,
        ),
        GestureDetector(
          onTap: () {
            if (color == '000000') {
              RoutingProvider.pushNamed(
                routeName: Routes.userOfferDetailsScreen,
                arguments: {'service': service, 'color': color},
              );
            } else {
              RoutingProvider.pushNamed(
                routeName: Routes.sharedServiceDetailsScreen,
                arguments: {'service': service, 'color': color},
              );
            }
          },
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(15.r),
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(5.r)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100.w,
                      height: 115.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(
                            width: 3,
                            color: Utility.hexColor(color),
                          )),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(2.r),
                          child: CustomNetworkImage(
                            imageUrl: service.photo.isNotEmpty
                                ? service.photo[0].fullname
                                : service.images.isNotEmpty
                                    ? Utility.getServiceImageURL(
                                        service.images[0].share)
                                    : 'https://picsum.photos/100/115?random=${service.id}',
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (userType != UserType.guest)
                                  Text(
                                    '${Utility.getPriceSubString(service.multipricesIncludesTax.firstPrice)}€/H',
                                    style: userType == UserType.subscribedUser
                                        ? AppTextStyles.header4InterGrey50
                                            .copyWith(
                                                decoration:
                                                    TextDecoration.lineThrough)
                                        : AppTextStyles.header2Inter,
                                  ),
                                if (userType != UserType.guest)
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                if (userType == UserType.subscribedUser)
                                  Text(
                                      '${Utility.getPriceSubString(service.multipricesIncludesTax.secondPrice)}€/H',
                                      style: AppTextStyles.header2Inter),
                              ]),
                          Flexible(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: HtmlWidget(
                                service.description,
                                textStyle: AppTextStyles.paragraph3Roboto
                                    .copyWith(wordSpacing: 2.w, height: 1.4.h),
                              ),
                            ),
                            /*  Text(
                            service.description,
                            style: AppTextStyles.paragraph3Roboto
                                .copyWith(wordSpacing: 2.w, height: 1.4.h),
                            textAlign: TextAlign.left,
                          ) */
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  bottom: 15.h,
                  right: 15.w,
                  child: SizedBox(
                    width: 35.r,
                    height: 35.r,
                    child: FloatingActionButton(
                        onPressed: () {
                          if (color == '000000') {
                            RoutingProvider.pushNamed(
                              routeName: Routes.userOfferDetailsScreen,
                              arguments: {'service': service, 'color': color},
                            );
                          } else {
                            RoutingProvider.pushNamed(
                              routeName: Routes.sharedServiceDetailsScreen,
                              arguments: {'service': service, 'color': color},
                            );
                          }
                        },
                        backgroundColor: Utility.hexColor(color),
                        heroTag: null,
                        elevation: 0.0,
                        child: Icon(
                          Icons.arrow_forward,
                          color: color == '000000'
                              ? AppColors.whiteColor
                              : AppColors.blackColor,
                          size: 15.r,
                        )),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
