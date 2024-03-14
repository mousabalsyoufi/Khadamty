import 'package:faciltateur_de_vies/shared_widgets/custom_network_image.dart';

import 'custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// custom header background is image
class CustomHeaderWithImage extends StatelessWidget {
  const CustomHeaderWithImage({
    Key? key,
    required this.url,
    required this.imageWidth,
    required this.imageHeight,
    this.hasBackButton = false,
  }) : super(key: key);
  final String url;
  final double imageWidth;
  final double imageHeight;
  final bool hasBackButton;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15.r),
          ),
          child: CustomNetworkImage(
            imageUrl: url,
            height: imageHeight,
            width: imageWidth,
            fit: BoxFit.cover,
          ),
        ),
        if (hasBackButton)
          Positioned(
            top: 50.h,
            left: 20.w,
            child: const CustomBackButton(),
          ),
      ],
    );
  }
}
