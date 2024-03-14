import 'package:flutter/material.dart';

import '../constants/colors/colors.dart';

class CustomFloatingDatePickerButton extends StatelessWidget {
  final Function onPress;
  const CustomFloatingDatePickerButton({Key? key, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.blackColor,
      elevation: 0.0,
      heroTag: null,
      child: const Icon(
        Icons.calendar_month_outlined,
        color: AppColors.whiteColor,
      ),
      onPressed: () => onPress(),
    );
  }
}
