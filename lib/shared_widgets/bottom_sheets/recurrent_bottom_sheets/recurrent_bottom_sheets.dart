import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/recurrent_bottom_sheets/sheets/recurrent_duration_bottom_sheet.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/recurrent_bottom_sheets/sheets/recurrent_period_bottom_sheet.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/recurrent_bottom_sheets/sheets/recurrent_time_bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors/colors.dart';

class RecurrentBottomSheets{
  static void showRecurrentTimeBottomSheet(BuildContext context, int selectedTime, Function(int) onChangeSelection) {
    // show pick recurrent time for service or offer bottom sheet
    showModalBottomSheet(
        backgroundColor: AppColors.transparentColor,
        context: context,
        builder: (BuildContext context){
      return RecurrentTimeBottomSheet(selectedTime: selectedTime, onChangeSelection: onChangeSelection,);
    });

  }

  static void showRecurrentPeriodBottomSheet(BuildContext context, int selectedWeek, Function(int) onChangeSelection) {
    // show pick recurrent period for service or offer bottom sheet
    showModalBottomSheet(
        backgroundColor: AppColors.transparentColor,
        context: context,
        builder: (BuildContext context){
      return RecurrentPeriodBottomSheet(selectedWeek: selectedWeek, onChangeSelection: onChangeSelection,);
    });

  }
  
  static void showRecurrentDurationBottomSheet(BuildContext context) {
    // show pick recurrent duration for service or offer bottom sheet
    showModalBottomSheet(
        backgroundColor: AppColors.transparentColor,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context){
      return const RecurrentDurationBottomSheet();
    });

  }
}