import 'package:cached_network_image/cached_network_image.dart';
import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/constants/icons/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class CircleImageWithBorder extends StatelessWidget {
  final String url;
  final double width, height;
  final double borderWidth;
  final Color borderColor;
  const CircleImageWithBorder(
      {Key? key,
      required this.url,
      required this.width,
      required this.height,
      this.borderColor = AppColors.whiteColor,
      this.borderWidth = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => Shimmer.fromColors(
            baseColor: AppColors.whiteColor,
            highlightColor: AppColors.greyColor,
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey),
              width: width,
              height: height,
            )),
        errorWidget: (context, url, error) => SvgPicture.asset(
          AppIcons.cacheImageWarningIcon,
          width: width,
          height: height,
        ),
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            color: AppColors.grey10Color,
            image: DecorationImage(
              image: CachedNetworkImageProvider(url),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(50.r)),
            border: Border.all(
              color: borderColor,
              width: borderWidth,
            ),
          ),
        ),
      ),
    );
  }
}
