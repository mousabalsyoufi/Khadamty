import 'package:carousel_slider/carousel_slider.dart';
import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImageSlider extends StatefulWidget {
  const CustomImageSlider({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CustomImageSlider();
  }
}

class _CustomImageSlider extends State<CustomImageSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> images = [
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider(
        items: images
            .map(
              (imageUrl) => Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.r),
                    child: CustomNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                    )),
              ),
            )
            .toList(),
        carouselController: _controller,
        options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1,
            height: 110.h,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: _current == entry.key
                  ? Container(
                      width: 15.0.w,
                      height: 8.0.h,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border:
                              Border.all(width: 1, color: AppColors.blackColor),
                          color: AppColors.blackColor),
                    )
                  : Container(
                      width: 8.0.w,
                      height: 8.0.h,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(width: 1, color: AppColors.blackColor),
                          color: AppColors.transparentColor),
                    ),
            );
          }).toList(),
        ),
      ),
    ]);
  }
}
