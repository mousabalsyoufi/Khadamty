import 'dart:convert';
import 'dart:typed_data';

import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleImageFileWithBorder extends StatelessWidget {
  final String photoFile;
  final double width, height;
  final double borderWidth;
  final Color borderColor;
  const CircleImageFileWithBorder(
      {Key? key,
      required this.photoFile,
      required this.width,
      required this.height,
      this.borderColor = AppColors.whiteColor,
      this.borderWidth = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Uint8List decodedBytes = base64.decode(photoFile);

    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35.r),
        child: Image.memory(
          decodedBytes,
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
