import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/reservation_confirmation_bottom_sheets/sheets/reservation_confirmed_bottom_sheet.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/reservation_confirmation_bottom_sheets/sheets/reservation_modified_bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors/colors.dart';

class ReservationConfirmationBottomSheets {
  static void showReservationConfirmation({
    required BuildContext context,
    required Function onTapFirstButton,
    required String headerText,
    required String contentText,
    required String firstButtonText,
  }) {
    // show reservation confirmation bottom sheet
    showModalBottomSheet(
        backgroundColor: AppColors.transparentColor,
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop:() async => await Future.value(false),
            child: GestureDetector(
              onVerticalDragStart: (_) {},
              child: ReservationConfirmedBottomSheet(
                onTapFirstButton: onTapFirstButton,
                headerText: headerText,
                contentText: contentText,
                firstButtonText: firstButtonText,
              ),
            ),
          );
        });
  }

  static void showReservationModified(BuildContext context) {
    // show reservation Modified bottom sheet
    showModalBottomSheet(
        backgroundColor: AppColors.transparentColor,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return const ReservationModifiedBottomSheet();
        });
  }
}
