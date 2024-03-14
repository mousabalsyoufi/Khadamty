import '../constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRadioButton extends StatefulWidget {
  final int value;
  final int groupValue;
  final double textSpacing;
  final String title;
  final bool hasPadding;
  final TextStyle selectedTextStyle;
  final TextStyle unselectedTextStyle;
  final void Function(int) onChanged;
  const CustomRadioButton(
      {Key? key,
      required this.title,
      required this.value,
      required this.groupValue,
      this.textSpacing = 10,
      this.hasPadding = true,
      required this.selectedTextStyle,
      required this.unselectedTextStyle,
      required this.onChanged})
      : super(key: key);

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      onTap: () => widget.onChanged(widget.value),
      child: Container(
        padding: EdgeInsets.all(widget.hasPadding ? 11.0.r : 0.0),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(5.r))),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(1),
              padding: const EdgeInsets.all(1),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.blackColor),
              child: Container(
                margin: const EdgeInsets.all(0.5),
                padding: const EdgeInsets.all(0.5),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.whiteColor),
                child: Icon(
                  Icons.circle,
                  size: 16.r,
                  color: selected ? AppColors.greenColor : AppColors.whiteColor,
                ),
              ),
            ),
            SizedBox(
              width: widget.textSpacing.w,
            ),
            Text(
              widget.title,
              style: selected
                  ? widget.selectedTextStyle
                  : widget.unselectedTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
