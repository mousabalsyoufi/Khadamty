import 'package:faciltateur_de_vies/screens/easer_bonus_screen/presentation/widgets/header_bonus_widget.dart';
import 'package:flutter/material.dart';
import '../../../../shared_widgets/bottom_sheets/calendar_bottom_sheet/calendar_bottom.dart';
import '../../../../shared_widgets/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared_widgets/custom_floating_date_picker_button.dart';
import '../widgets/custom_table_widget.dart';

/// This class for User interface for Easer Bonus Screen
/// it has a two parts [ @Headers(HeaderBonusWidget) , @Table(CustomTableWidget) ]
class EaserBonusScreen extends StatelessWidget {
  const EaserBonusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("My Bonus",actions:[Padding(
        padding:  EdgeInsets.all(8.r),
        child: CustomFloatingDatePickerButton(onPress: (){
          CalendarBottomSheet.showCalendarMonthsDialog(context);
        },),
      )]),
      body: Padding(
        padding:  EdgeInsetsDirectional.only(start: 20.w,end: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:const [
            HeaderBonusWidget(bonus: 50),
            Expanded(child: CustomTableWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
