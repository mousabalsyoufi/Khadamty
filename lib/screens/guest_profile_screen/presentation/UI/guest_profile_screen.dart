import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/presentation/widgets/register_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuestProfileScreen extends StatelessWidget {
  const GuestProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              'Create my account',
              style: AppTextStyles.header1Inter,
              textAlign: TextAlign.start,
            ),
          ),
          const RegisterScreenBody(),
        ],
      ),
    );
  }
}
