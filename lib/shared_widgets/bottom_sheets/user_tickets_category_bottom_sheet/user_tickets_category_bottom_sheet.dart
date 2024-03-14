import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/user_tickets_category_bottom_sheet/user_tickets_category_bottom_sheet_impl.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors/colors.dart';

class UserTicketCategoriesBottomSheet{
  static void showUserTicketCategoriesBottomSheet(BuildContext context) {
   // show user ticket bottom sheet
    showModalBottomSheet(
        backgroundColor: AppColors.transparentColor,
        context: context,
        builder: (BuildContext context) {
          return const TicketCategoryBottomSheetImp();});
  }
}