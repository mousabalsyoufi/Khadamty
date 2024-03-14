import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/screens/easer_home_screen/data/model/event_model.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_floating_date_picker_button.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../shared_widgets/bottom_sheets/calendar_bottom_sheet/calendar_bottom.dart';
import '../../business_logic/provider/easer_home_provider.dart';
import '../widgets/calendar_view.dart';
import '../widgets/event_card.dart';
import '../widgets/progress_line.dart';

//main easer home page
class EaserHomeScreen extends StatefulWidget {
  const EaserHomeScreen({Key? key}) : super(key: key);

  @override
  State<EaserHomeScreen> createState() => _EaserHomeScreenState();
}

class _EaserHomeScreenState extends State<EaserHomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<EaserHomeProvider>(context, listen: false)
          .getUpcomingServices(date: DateTime.now());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Padding(
        padding: EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 23.h,
            ),
           /*  Row(
              children: [
                SizedBox(
                  width: 270.w,
                  child: const ProgressIndicatorLine(
                    percent: 0.3,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                  width: 40.w,
                  height: 30.h,
                  child: CustomFloatingDatePickerButton(onPress: () {
                    CalendarBottomSheet.showCalendarDaysDialog(context);
                  }),
                )
              ],
            ), */
            const TableRangeCalendar(),
            SizedBox(
              height: 10.h,
            ),
            Consumer<EaserHomeProvider>(builder: (context, provider, _) {
              if (provider.upcomingLoading) {
                return const CustomProgressIndicator(
                    color: AppColors.blackColor);
              } else if (provider.upcomingOrdersList.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: provider.upcomingOrdersList.length,
                    itemBuilder: (BuildContext context, int index) => EventCard(
                      event: provider.upcomingOrdersList[index],
                    ),
                  ),
                );
              } else {
                return Container();
              }
            }),
          ],
        ),
      ),
    );
  }
}
