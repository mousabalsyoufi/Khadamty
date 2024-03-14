import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../business_logic/provider/easer_services_history_provider.dart';
import '../widgets/easer_service_card.dart';

class EaserServicesHistoryScreen extends StatefulWidget {
  const EaserServicesHistoryScreen({Key? key}) : super(key: key);

  @override
  State<EaserServicesHistoryScreen> createState() =>
      _EaserServicesHistoryScreenState();
}

class _EaserServicesHistoryScreenState
    extends State<EaserServicesHistoryScreen> {
  int? _page = 0;
  final int _limit = 10;
  DateTime? date;

  // history scroll list
  final ScrollController _scrollHistoryController = ScrollController();

  late EaserServicesHistoryProvider easerServicesHistoryProvider;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      easerServicesHistoryProvider =
          Provider.of<EaserServicesHistoryProvider>(context, listen: false);
      // rest provider values
      restProviderValues(easerServicesHistoryProvider);
      // call api the first time with default values..
      easerServicesHistoryProvider.getServicesHistory(
          limit: _limit, page: _page);

      _scrollHistoryController.addListener(() {
        if (_scrollHistoryController.position.atEdge) {
          if (_scrollHistoryController.position.pixels ==
              _scrollHistoryController.position.maxScrollExtent) {
            _page = _page! + 1;
            easerServicesHistoryProvider.getServicesHistoryNextPage(
                limit: _limit, page: _page, date: date);
          }
        }
      });
    });
    super.initState();
  }

  // rest the date to default values ...
  restProviderValues(EaserServicesHistoryProvider provider) {
    _page = 0;
    provider.restProviderValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Consumer<EaserServicesHistoryProvider>(
            builder: (context, provider, _) {
          if (provider.historyLoading) {
            return const CustomProgressIndicator(color: AppColors.blackColor);
          } else if (provider.serviceHistoryList != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*  SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Month rating",
                      style: AppTextStyles.header2Inter,
                    ),
                    GestureDetector(
                      onTap: () {
                        CustomSheets.showTextTextButtonBottomSheet(
                            context: context,
                            headlineText: 'Month rating',
                            contentText:
                                'This rating is based on the opinions of our customers and your attendance. A good rating allows you to obtain a bonus at the end of the month.',
                            buttonText: 'OK',
                            buttonTapFunction: () {
                              RoutingProvider.goBack();
                            });
                      },
                      child: Icon(
                        Icons.help,
                        size: 17.r,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 270.w,
                      child: const ProgressIndicatorLine(
                        percent: 0.8,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SizedBox(
                      width: 35.w,
                      height: 35.h,
                      child: CustomFloatingDatePickerButton(
                        onPress: () {
                          CalendarBottomSheet.showCalendarDaysDialog(context);
                        },
                      ),
                    )
                  ],
                ), */
                SizedBox(
                  height: 20.h,
                ),
                Text("Services history", style: AppTextStyles.header2Inter),
                SizedBox(
                  height: 15.h,
                ),
                Expanded(
                    child: ListView.builder(
                        controller: _scrollHistoryController,
                        itemCount: provider.serviceHistoryList!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return (provider.serviceHistoryList!.length + 1 ==
                                  index)
                              ? const CustomProgressIndicator(
                                  color: AppColors.blackColor)
                              : EaserServiceCard(
                                  serviceHistory:
                                      provider.serviceHistoryList![index]);
                        })),
              ],
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
