import 'package:faciltateur_de_vies/core/api_handler/urls.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/colors/colors.dart';


/// This class contain all helper method :
/// showToast, hexColor , changeStatusBarToBlack , changeStatusBarToTransparent and so on
class Utility {
  /// This function to change status bar to white color
  static changeStatusBarToWhite() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.whiteColor,
        statusBarIconBrightness: Brightness.dark));
  }
  /// This function to show Toast message in the bottom of screen with message
  static showToast(
      {ToastGravity gravity = ToastGravity.BOTTOM,
      Color? textColor,
      required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: gravity,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 15.0);
  }

  /// This function to convert color from string to HEX-Code otherwise return white color
  static Color hexColor(String? color) {
    if (color!.length == 6) {
      color = "FF$color";
    }
    if (color.length == 8) {
      return Color(int.parse("0x$color"));
    }
    return Colors.white;
  }
  /// This function to change status bar to Transparent color
  static changeStatusBarToTransparent() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparentColor,
        statusBarIconBrightness: Brightness.dark));
  }

  /// This function to change status bar to Black color
  static changeStatusBarToBlack() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.blackColor,
        statusBarIconBrightness: Brightness.light));
  }

  /// This function to change status bar to Grey color
  static changeStatusBarToGrey() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.greyColor,
        statusBarIconBrightness: Brightness.dark));
  }
  /// This function to lunch Map [Google Map]
  static void launchDirectionMap(double lat, double lng) async {
    String googleMapDirectionsApi =
        'https://www.google.com/maps/dir/?api=1&origin=&destination=$lat,$lng&travelmode=driving';
    await launchUrls(
        url: googleMapDirectionsApi,
        launchMode: LaunchMode.externalApplication);
  }


  /// This function to lunch Urls
  static Future<void> launchUrls(
      {required String url,
      LaunchMode launchMode = LaunchMode.platformDefault}) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: launchMode);
    } else {
      throw 'Could not luanch the url.';
    }
  }
  /// This function to get price after made subString with 5 digit
  static String getPriceSubString(String price) {
    if (price.length > 5) {
      return price.substring(0, 5);
    } else {
      return price;
    }
  }
 /// This function to show loader in the middle of screen
  static showLoader() {
    showDialog(
      context: RoutingProvider.navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
          backgroundColor: AppColors.blackColor.withOpacity(0.7),
          insetPadding: EdgeInsets.zero,
          child: Center(
            child: CupertinoActivityIndicator(
              color: AppColors.whiteColor,
              radius: 20.r,
            ),
          ),
        ),
      ),
    );
  }
  /// This is function to return full image url
  static String getServiceImageURL(String imageId) {
    return Urls.servicesImagesBaseURL + imageId;
  }
  /// This is function to remove loader
  static removeLoader() {
    RoutingProvider.goBack();
  }

  /// This is function to calculation the diff between to dateTime
  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).ceil();
  }
}
