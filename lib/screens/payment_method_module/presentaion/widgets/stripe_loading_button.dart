import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingButton extends StatefulWidget {
  final Future Function()? onPressed;
  final String text;

  const LoadingButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  LoadingButtonState createState() => LoadingButtonState();
}

class LoadingButtonState extends State<LoadingButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.w),
                primary: AppColors.blackColor),
            onPressed:
                (_isLoading || widget.onPressed == null) ? null : _loadFuture,
            child: _isLoading
                ? SizedBox(
                    height: 22.h,
                    width: 22.w,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.r,
                      color: AppColors.whiteColor,
                    ))
                : Text(widget.text),
          ),
        ),
      ],
    );
  }

  Future<void> _loadFuture() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await widget.onPressed!();
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      Utility.showToast(message: "somethings went wrong");
      rethrow;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
