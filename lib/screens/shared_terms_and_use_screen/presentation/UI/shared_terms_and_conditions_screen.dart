import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SharedTermsAndConditionsScreen extends StatelessWidget {
  const SharedTermsAndConditionsScreen(
      {super.key, required this.screenData});

  final Map<String, String> screenData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(screenData['title']!),
      body: Container(
        margin: EdgeInsets.all(20.r),
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Text(screenData['data']!),
          ],
        )),
      ),
    );
  }
}
