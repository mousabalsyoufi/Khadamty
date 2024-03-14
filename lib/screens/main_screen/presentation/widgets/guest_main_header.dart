import 'package:faciltateur_de_vies/constants/icons/icons.dart';
import 'package:faciltateur_de_vies/screens/main_screen/business_logic/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

// guest main header
class GuestMainHeader extends StatelessWidget {
  const GuestMainHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                Provider.of<MainProvider>(context, listen: false)
                    .changeActiveScreen(3);
              },
              child: SvgPicture.asset(
                AppIcons.guestProfileIcon,
                width: 35.w,
                height: 35.h,
              )),
          /* const Spacer(),
          const CustomLocationPickerButton(
            cityName: 'City',
          ), */
        ],
      ),
    );
  }
}
