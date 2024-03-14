import 'package:cached_network_image/cached_network_image.dart';
import 'package:faciltateur_de_vies/constants/icons/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/colors/colors.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  const CustomNetworkImage(
      {Key? key, this.fit, required this.imageUrl, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        placeholder: (context, url) => Shimmer.fromColors(
            baseColor: AppColors.whiteColor,
            highlightColor: AppColors.greyColor,
            child: Container(
              decoration: const BoxDecoration(color: Colors.grey),
              width: width,
              height: height,
            )),
        errorWidget: (context, url, error) => SvgPicture.asset(
              AppIcons.cacheImageWarningIcon,
              width: width,
              height: height,
            ),
        width: width,
        height: height);
  }
}
