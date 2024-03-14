import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/business_logic/provider/shared_services_categories_provider.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/presentation/widgets/service_list_item.dart';
import 'package:faciltateur_de_vies/shared_models/category_model.dart';
import 'package:faciltateur_de_vies/shared_models/category_service_model.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../routes/routes_provider/routes_provider.dart';
import '../../../main_screen/business_logic/provider/main_provider.dart';
import '../widgets/category_chip_list_item.dart';

class SharedServicesCategoriesScreen extends StatefulWidget {
  const SharedServicesCategoriesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SharedServicesCategoriesScreen> createState() =>
      _SharedServicesCategoriesScreenState();
}

class _SharedServicesCategoriesScreenState
    extends State<SharedServicesCategoriesScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      int selectedIndex = Provider.of<MainProvider>(
              RoutingProvider.navigatorKey.currentContext!,
              listen: false)
          .activeCategoryIndex;
      Provider.of<SharedServicesCategoriesProvider>(context, listen: false)
          .getCategories(selectedIndex);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SharedServicesCategoriesProvider>(
        builder: (context, sharedServicesCategoriesProvider, child) {
      if (sharedServicesCategoriesProvider.isLoading) {
        return const CustomProgressIndicator(color: AppColors.blackColor);
      } else {
        if (sharedServicesCategoriesProvider.categories.isNotEmpty) {
          return Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 50.w,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ListView.builder(
                  itemBuilder: ((context, index) {
                    CategoryModel item =
                        sharedServicesCategoriesProvider.categories[index];
                    return Container(
                        margin: EdgeInsetsDirectional.only(end: 5.w),
                        child: CategoryChipListItem(
                          category: item,
                          isSelected: sharedServicesCategoriesProvider
                                  .activeCategoryIndex ==
                              index,
                          index: index,
                        ));
                  }),
                  itemCount: sharedServicesCategoriesProvider.categories.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              if (sharedServicesCategoriesProvider.servicesLoading)
                const CustomProgressIndicator(color: AppColors.blackColor),
              if (sharedServicesCategoriesProvider.services.isNotEmpty)
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: ListView.builder(
                      itemBuilder: ((context, index) {
                        CategoryServiceModel service =
                            sharedServicesCategoriesProvider.services[index];
                        return Column(
                          children: [
                            ServiceListItem(
                                service: service,
                                color: sharedServicesCategoriesProvider
                                    .categories[sharedServicesCategoriesProvider
                                        .activeCategoryIndex]
                                    .color),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        );
                      }),
                      itemCount:
                          sharedServicesCategoriesProvider.services.length,
                    ),
                  ),
                ),
            ],
          );
        } else {
          return Container();
        }
      }
    });
  }
}
