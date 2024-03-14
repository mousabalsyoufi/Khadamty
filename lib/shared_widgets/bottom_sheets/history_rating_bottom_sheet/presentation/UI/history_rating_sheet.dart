import 'package:flutter/material.dart';

import '../../../../../constants/colors/colors.dart';
import 'history_rating_bottom_sheet_impl.dart';

class HistoryRatingBottomSheet {
  static void showHistoryRatingBottom(BuildContext context, String orderId, String serviceId) {
    // show Rating history bottom sheet
    showModalBottomSheet(
        backgroundColor: AppColors.transparentColor,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context){
      return HistoryRatingBottomSheetImp(orderId: orderId, serviceProductId: serviceId,);
    });

  }
}