import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors/colors.dart';
import '../constants/text_styles/text_styles.dart';

class CustomButtonBlack extends StatelessWidget {
  const CustomButtonBlack(
      {Key? key, required this.buttonContent, required this.onPressed})
      : super(key: key);

  final Widget buttonContent;
  final Function? onPressed;
  @override
  Widget build(BuildContext context) {
    bool disabled = onPressed == null;
    return ElevatedButton(
      onPressed: disabled ? null : () => onPressed!(),
      style: ButtonStyle(
        elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
          return 0.0;
        }),
        textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppTextStyles.robotoBoldWhite
                  .copyWith(color: AppColors.grey40Color);
            }
            return AppTextStyles.robotoBoldWhite;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.whiteColor;
            }
            return AppColors.blackColor;
          },
        ),
        minimumSize: MaterialStateProperty.resolveWith<Size>(
            (Set<MaterialState> states) {
          return Size.fromHeight(45.h);
        }),
      ),
      child: buttonContent, 
    );
  }
}
