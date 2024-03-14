import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:dartz/dartz.dart' as dartZ;
import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/business_logic/provider/user_bookings_provider.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/history_orders_model.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/upcoming_orders_model.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/presentation/widgets/upcoming_event_list_item.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../../shared_widgets/bottom_sheets/calendar_bottom_sheet/calendar_bottom.dart';
import '../../../../shared_widgets/custom_floating_date_picker_button.dart';
import '../widgets/history_event_list_item.dart';

// This is Interface to show the history orders and upcoming orders...

class UserBookingsScreen extends StatefulWidget {
  const UserBookingsScreen({Key? key}) : super(key: key);

  @override
  State<UserBookingsScreen> createState() => _UserBookingsScreenState();
}

class _UserBookingsScreenState extends State<UserBookingsScreen> {
  int? page = 0;
  int? limit = 10;
  DateTime? date;
  int tabIndex = 0;

  // upcoming scroll list
  final ScrollController _scrollUpcomingController = ScrollController();
// history scroll list
  final ScrollController _scrollHistoryController = ScrollController();

  late UserBookingsProvider userBookingsProvider ;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      userBookingsProvider =  Provider.of<UserBookingsProvider>(context, listen: false);
      // rest provider values
      restProviderValues(userBookingsProvider);
      // call api the first time with default values..
      userBookingsProvider.upcomingOrders(limit: limit, page: page);

      _scrollUpcomingController.addListener(() {
        if (_scrollUpcomingController.position.atEdge) {
          if (_scrollUpcomingController.position.pixels ==
              _scrollUpcomingController.position.maxScrollExtent) {
            page = page! + 1;
            userBookingsProvider.upcomingOrdersNextPage(limit: limit, page: page, date: date);
          }
        }
      });

      _scrollHistoryController.addListener(() {
        if (_scrollHistoryController.position.atEdge) {
          if (_scrollHistoryController.position.pixels ==
              _scrollHistoryController.position.maxScrollExtent) {
            page = page! + 1;
            userBookingsProvider.historyOrdersNextPage(limit: limit, page: page, date: date);
          }
        }
      });
    });
    super.initState();
  }
  // rest the date to default values ...

  restProviderValues(UserBookingsProvider userBookingsProvider) {
    page = 0;
    userBookingsProvider.historyOrdersList =
        userBookingsProvider.upcomingOrdersList = null;
    userBookingsProvider.isHistoryListReach =
        userBookingsProvider.isUpcomingListReach = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Container(
                  width: 300.w,
                  height: 30.h,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    child: TabBar(
                      labelColor: AppColors.whiteColor,
                      unselectedLabelColor: AppColors.grey70Color,
                      indicatorSize: TabBarIndicatorSize.tab,
                      splashBorderRadius: BorderRadius.circular(25.r),
                      indicator: BubbleTabIndicator(
                        indicatorColor: AppColors.blackColor,
                        indicatorHeight: 30.h,
                        tabBarIndicatorSize: TabBarIndicatorSize.tab,
                        indicatorRadius: 25.r,
                      ),
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      onTap: (int? index) {
                        tabIndex = index!;
                        page =  0;
                        if (index == 0) {
                          userBookingsProvider
                              .upcomingOrders(
                                  limit: limit, page: page, date: date);
                        } else {
                          userBookingsProvider
                              .historyOrders(
                                  limit: limit, page: page, date: date);
                        }
                      },
                      tabs: const [
                        Tab(
                          text: 'Upcoming',
                        ),
                        Tab(
                          text: 'History',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 35.h,
                  width: 35.w,
                  child: CustomFloatingDatePickerButton(
                    onPress: () {
                      CalendarBottomSheet.showCalendarMonthsDialogExtend(
                          context,
                          selectedDate: date, onSelectionChanged:
                              (DateRangePickerSelectionChangedArgs
                                  dateRangePickerSelectionChangedArgs) {
                        if (dateRangePickerSelectionChangedArgs.value.toString().contains(" ")) {
                          String datePicker = dateRangePickerSelectionChangedArgs.value.toString().split(" ")[0];
                          date = DateTime.parse(datePicker);
                          restProviderValues(userBookingsProvider);
                          if (tabIndex == 0) {
                            userBookingsProvider.upcomingOrders(
                                limit: limit, page: page, date: date);
                          } else {
                            userBookingsProvider
                                .historyOrders(
                                    limit: limit, page: page, date: date);
                          }
                        }
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 5.w,
                )
              ],
            ),
            SizedBox(height: 20.h),
            Expanded(
                child: TabBarView(children: [
              Selector<UserBookingsProvider, dartZ.Tuple2<bool, bool>>(
                  selector: (BuildContext context, value) => dartZ.Tuple2(
                      value.upcomingLoading, value.upcomingLoadingNextPage),
                  builder: (BuildContext context, data, child) {
                    List<UpcomingOrdersModel>? upcomingList =Provider.of<UserBookingsProvider>(context, listen: false).upcomingOrdersList;

                    if (data.value1) {
                      return const CustomProgressIndicator(
                          color: AppColors.blackColor);
                    } else if (upcomingList != null) {
                      if(upcomingList.isEmpty){
                        return const Center(child: Text("No Data"),);
                      }
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: ListView.builder(
                          controller: _scrollUpcomingController,
                          itemBuilder: (context, index) {
                            return (upcomingList.length + 1 == index )?
                                const CustomProgressIndicator(color: AppColors.blackColor):
                             Column(
                              children: [
                                UpcomingEventListItem(upcomingOrdersModel: upcomingList[index]),
                                SizedBox(height: 15.h),
                              ],
                            );
                          },
                          shrinkWrap: true,
                          itemCount: upcomingList.length,
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }),
              Selector<UserBookingsProvider, dartZ.Tuple2<bool, bool>>(
                  selector: (BuildContext context, value) => dartZ.Tuple2(value.historyLoading, value.historyLoadingNextPage),
                  builder: (BuildContext context, data, child) {
                    List<HistoryOrdersModel>? historyList =Provider.of<UserBookingsProvider>(context, listen: false).historyOrdersList;
                    if (data.value1) {
                      return const CustomProgressIndicator(
                          color: AppColors.blackColor);
                    } else if (historyList != null) {
                      if(historyList.isEmpty){
                        return const Center(child: Text("No Data"),);
                      }
                     return
                       Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: ListView.builder(
                              itemCount: historyList.length,
                              controller: _scrollHistoryController,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return (historyList.length + 1 == index )?
                                const CustomProgressIndicator(color: AppColors.blackColor):
                                 Column(
                                  children: [
                                    HistoryListItem(
                                        historyOrdersModel: historyList[index]),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                  ],
                                );
                              }));
                    } else {
                      return Container();
                    }
                  }),
            ])),
          ],
        ),
      ),
    );
  }
}
