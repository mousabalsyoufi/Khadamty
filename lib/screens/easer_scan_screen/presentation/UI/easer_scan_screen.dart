import 'dart:io';

import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/text_styles/text_styles.dart';
import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/screens/easer_service_process_screen/business_logic/provider/easer_report_provider.dart';
import 'package:faciltateur_de_vies/screens/main_screen/business_logic/provider/main_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/custom_sheets/custom_sheets.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_button_white.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/icons/icons.dart';
import '../../../../routes/routes_names/routes_names.dart';

class EaserScanScreen extends StatefulWidget {
  final bool isFirstScan;
  EaserScanScreen({Key? key, required this.isFirstScan}) : super(key: key);

  @override
  State<EaserScanScreen> createState() => _EaserScanScreenState();
}

class _EaserScanScreenState extends State<EaserScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    Utility.changeStatusBarToBlack();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  color: AppColors.blackColor,
                  child: Center(
                    child: Text(
                      'Scan Your RFID badge',
                      style: AppTextStyles.robotoRegularWhite
                          .copyWith(fontSize: 16.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                    overlay: QrScannerOverlayShape(
                      cutOutHeight: 250.h,
                      cutOutWidth: 250.w,
                      // overlayColor: Colors.transparent,
                      borderRadius: 0.r,
                      borderWidth: 15.r,
                      borderLength: 15.r,
                      borderColor: Colors.white,
                    ),
                  ),
                  Positioned(
                      bottom: 5.h,
                      left: 90.w,
                      right: 90.w,
                      child: Text(
                        "Align QR Code in Frame",
                        style: AppTextStyles.interMeduimWhite,
                      ))
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: AppColors.blackColor,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 40.w, horizontal: 20.h),
                  child: CustomButtonWhite(
                    buttonText: 'OK',
                    onPressed: () {
                      if (widget.isFirstScan) {
                        RoutingProvider.pushNamed(
                            routeName: Routes.easerReportScreen);
                      } else {
                        CustomSheets.showIconTextButtonBottomSheet(
                            context: context,
                            iconPath: AppIcons.successShieldMarkIcon,
                            contentText:
                                "Your report has been sent with success !",
                            buttonText: "OK",
                            buttonTapFunction: ()  {
                              Provider.of<EaserReportProvider>(context, listen: false).restPercent();
                              Provider.of<MainProvider>(context, listen: false).changeActiveOffline(1);
                               RoutingProvider.pushNamedAndRemoveAllBack(routeName: Routes.mainScreen);
                            });

                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    this.controller!.resumeCamera();
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
