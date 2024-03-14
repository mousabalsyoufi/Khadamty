import 'package:faciltateur_de_vies/screens/user_bookings_screen/business_logic/provider/user_bookings_provider.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/history_orders_model.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/upcoming_orders_model.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/presentation/widgets/history_event_list_item.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/presentation/widgets/upcoming_event_list_item.dart';
import 'package:faciltateur_de_vies/screens/user_home_screen/business_logic/provider/user_home_provider.dart';
import 'package:faciltateur_de_vies/screens/user_home_screen/presentation/widgets/category_list_item.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:dartz/dartz.dart' as _zDart;
import '../../../../constants/colors/colors.dart';
import '../../../../constants/text_styles/text_styles.dart';
import '../../../../shared_widgets/custom_image_slider.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserHomeProvider>(context, listen: false).getCategories();
       UserBookingsProvider provider =   Provider.of<UserBookingsProvider>(context,listen: false);
       provider.upcomingOrders(page: 0,limit: 2,date: DateTime.now());
      provider.historyOrders(page: 0,limit: 10,date: DateTime.now());

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15.h,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const CustomImageSlider()),
          SizedBox(
            height: 15.h,
          ),
          Selector<UserBookingsProvider, _zDart.Tuple2<bool, bool>>(
              selector: (BuildContext context, value) => _zDart.Tuple2(
                  value.upcomingLoading, value.upcomingLoadingNextPage),
              builder: (BuildContext context, data, child) {
                List<UpcomingOrdersModel>? upcomingList = Provider.of<UserBookingsProvider>(context, listen: false).upcomingOrdersList;
                if (data.value1) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(vertical: 8.h),
                    child: const CustomProgressIndicator(
                        color: AppColors.blackColor),
                  );
                } else if (upcomingList != null) {
                  if(upcomingList.isEmpty){
                    return const Center(child: Text("No Data"),);
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Upcoming',
                          style: AppTextStyles.header2Inter,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 100.h,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return (upcomingList.length + 1 == index )?
                              const CustomProgressIndicator(color: AppColors.blackColor):
                              Column(
                                children: [
                                  UpcomingEventListItem(upcomingOrdersModel: upcomingList[index]),
                                ],
                              );
                            },
                            shrinkWrap: true,
                            itemCount: 1,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              }),
          Consumer<UserHomeProvider>(
            builder: (context, userHomeProvider, child) {
              if (userHomeProvider.isLoading) {
                return Padding(
                  padding:  EdgeInsets.symmetric(vertical: 8.h),
                  child: const CustomProgressIndicator(
                    color: AppColors.blackColor,
                  ),
                );
              } else {
                if (userHomeProvider.categories.isNotEmpty) {
                  return SingleChildScrollView(
                    child:
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          'Categories',
                          style: AppTextStyles.header2Inter,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: 164.h,
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20.w,
                              mainAxisSpacing: 20.h,
                              childAspectRatio: 2.0),
                          itemBuilder: ((context, index) => CategoryListItem(
                            categoryModel: userHomeProvider.categories[index],
                            categoryIndex: index,
                          )),
                          itemCount: userHomeProvider.categories.length,
                          shrinkWrap: true,
                        ),
                      ),
                    ]),
                  );
                } else {
                  return Container();
                }
              }
            }),
          SizedBox(
            height: 15.h,
          ),
          SizedBox(
            width: double.infinity,
            child: Selector<UserBookingsProvider, _zDart.Tuple2<bool, bool>>(
                selector: (BuildContext context, value) =>
                    _zDart.Tuple2(
                        value.historyLoading, value.historyLoadingNextPage),
                builder: (BuildContext context, data, child) {
                  List<HistoryOrdersModel>? historyList =
                      Provider.of<UserBookingsProvider>(context,
                          listen: false)
                          .historyOrdersList;
                  if (data.value1) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(vertical: 8.h),
                      child: const CustomProgressIndicator(
                          color: AppColors.blackColor),
                    );
                  } else if (historyList != null) {
                    if(historyList.isEmpty){
                      return const Center(child: Text("No Data"),);
                    }
                    return
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order again',
                                style: AppTextStyles.header2Inter,
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                height: 100.h,
                                child: ListView.builder(
                                    itemCount: historyList.length,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder: (BuildContext context, int index) {
                                      return SizedBox(
                                        width: 320.w,
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(horizontal:2.w),
                                          child: HistoryListItem(
                                              historyOrdersModel: historyList[index]),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ));
                  } else {
                    return Container();
                  }
                }),
          ),
        ],
      ),
    );
  }
}
