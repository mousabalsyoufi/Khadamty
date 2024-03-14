import 'package:flutter/material.dart';

import '../../../constants/colors/colors.dart';
import 'cancellation_confirmation_bottom_sheet.dart';

class CancellationConfirmationBottomSheet {
  static void showCancellationConfirmationBottomSheet(BuildContext context) {
    // show cancellation bottom sheet
    showModalBottomSheet(
        backgroundColor: AppColors.transparentColor,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
         return const CancellationConfirmationBottom();
        });
  }
}
