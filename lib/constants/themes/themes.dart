import 'package:flutter/material.dart';

import '../colors/colors.dart';

// App Theme Style

class AppThemes {
  // This is theme for app
 static ThemeData appTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: AppColors.greyColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
