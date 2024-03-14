import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/consts/consts.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/core/local_storage/storage_manager.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/screens/easer_catalog_screen/business_logic/provider/easer_catalog_provider.dart';
import 'package:faciltateur_de_vies/screens/easer_catalog_screen/data/model/catalog_model_fake.dart';
import 'package:faciltateur_de_vies/screens/easer_catalog_screen/presentation/widgets/custom_counter_button.dart';
import 'package:faciltateur_de_vies/shared_models/shared_help_ticket_request_model.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/custom_sheets/custom_sheets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../../constants/icons/icons.dart';
import '../../../../shared_widgets/custom_network_image.dart';
import '../../data/model/catalog_model.dart';

class CatalogCardWidget extends StatelessWidget {
  final int catalogIndex;
  final CatalogModel catalog;
  const CatalogCardWidget(
      {Key? key, required this.catalog, required this.catalogIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      width: 320.w,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(5.r))),
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(2.r),
              child: CustomNetworkImage(
                  imageUrl: catalog.photo.isNotEmpty
                      ? catalog.photo[0].fullname
                      : 'https://picsum.photos/50/70?random=${catalog.id}',
                  height: 50.h,
                  width: 50.h),
            ),
            SizedBox(
              width: 15.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  catalog.label,
                  style: AppTextStyles.robotoBoldBlack(12.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    CustomCounterButton(
                        increase: false, catalogIndex: catalogIndex),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      catalog.count.toString(),
                      style: AppTextStyles.robotoBoldBlack(12.sp),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    CustomCounterButton(
                      increase: true,
                      catalogIndex: catalogIndex,
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            InkWell(
                onTap: () {
                  if (catalog.count > 0) {
                    CustomSheets.showTextTextTwoButtonBottomSheet(
                        context: context,
                        headlineText:
                            'Are you sure to order ${catalog.count} ${catalog.label}?',
                        contentText:
                            'Your product request will be sent to your Major.',
                        acceptButtonText: 'Yes',
                        rejectButtonText: 'No',
                        acceptButtonColor: AppColors.whiteColor,
                        rejectButtonColor: AppColors.blackColor,
                        acceptButtonTapFunction: () async {
                          RoutingProvider.goBack();
                          int ticketId = await Provider.of<
                                  EaserCatalogProvider>(context, listen: false)
                              .equipmentRequest(
                                  requestModel: SharedHelpTicketRequestModel(
                                      fkSoc: StorageManager.getUserSocId(),
                                      subject: 'Equipment Request',
                                      message:
                                          '${catalog.label} ${catalog.count}',
                                      typeCode: Consts.comTicket,
                                      categoryCode:
                                          Consts.otherCategoryCodeTicket,
                                      severityCode:
                                          Consts.normalSeverityTicket));
                          if (ticketId > 0) {
                            // ignore: use_build_context_synchronously
                            Provider.of<EaserCatalogProvider>(context,
                                    listen: false)
                                .resetCatalogCount(catalogIndex);
                            CustomSheets.showIconTextButtonBottomSheet(
                                context: context,
                                iconPath: AppIcons.successMarkIcon,
                                contentText:
                                    'Your order request has been sent successfully',
                                buttonText: 'OK',
                                buttonTapFunction: () {
                                  RoutingProvider.goBack();
                                });
                          }
                        },
                        rejectButtonTapFunction: () {
                          RoutingProvider.goBack();
                        },
                        acceptButtonStyle: AppTextStyles.robotoMediumBlack
                            .copyWith(fontSize: 16.sp),
                        rejectButtonStyle: AppTextStyles.robotoMediumWhite
                            .copyWith(fontSize: 16.sp),
                        buttonWidth: 150.w,
                        borderColor: AppColors.blackColor);
                  }
                },
                child: SvgPicture.asset(
                  AppIcons.packageIcon,
                  height: 30.h,
                  width: 30.h,
                  fit: BoxFit.cover,
                ))
          ],
        ),
      ),
    );
  }
}
