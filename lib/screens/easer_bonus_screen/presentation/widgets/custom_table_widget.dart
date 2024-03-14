import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/core/extensions/date_extensions.dart';
import 'package:faciltateur_de_vies/screens/easer_bonus_screen/data/model/bonus_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/// This class a small part from Bonus Screen [CustomTableWidget]

class CustomTableWidget extends StatefulWidget {
  const CustomTableWidget({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _CustomTableWidgetState();
}

class _CustomTableWidgetState extends State<CustomTableWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 20.h),
        _header(),
        SizedBox(height: 7.h),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(5.r))
            ),
            child: ListView.separated(
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsetsDirectional.only(top:  10.h, bottom: 10.h),
                  child: _getRow(bonus[index]),
                );
              },
              separatorBuilder: (_, __) => const Divider(),
              itemCount: bonus.length,
            ),
          ),
        )
      ],
    );
  }

  Widget _header() {
    return Row(
        children: List.generate(
      headers.length,
      (index) => _element(
        Text(
          headers[index],
          textAlign: TextAlign.center,
          style: AppTextStyles.robotoBoldBlack(12.sp),
        ),
      ),
    ));
  }

  Flexible _element(Widget widget, [flex = 1]) {
    return Flexible(
      fit: FlexFit.tight,
      flex: flex,
      child: widget,
    );
  }

  Widget _getRow(BonusModel data) {
    return Row(children: [
      _element(Text(
        data.date.ddMMMMyyyy(),
        textAlign: TextAlign.center,
        style: AppTextStyles.robotoMediumBlack
            .copyWith(color: AppColors.grey70Color),
      )),
      _element(Text(
        data.note.ddMM(),
        textAlign: TextAlign.center,
        style: AppTextStyles.robotoMediumBlack
            .copyWith(color: AppColors.grey70Color),
      )),
      _element(Text(
        "${data.premium} €",
        textAlign: TextAlign.center,
        style: AppTextStyles.robotoMediumBlack,
      ))
    ]);
  }
}
