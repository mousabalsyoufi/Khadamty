import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotosViewDialog extends StatefulWidget {
  const PhotosViewDialog(
      {Key? key, required this.photos, required this.currentIndex})
      : super(key: key);

  final List<String> photos;
  final int currentIndex;

  @override
  State<PhotosViewDialog> createState() => _PhotosViewDialogState();
}

class _PhotosViewDialogState extends State<PhotosViewDialog> {
  late PageController _pageController;
  late int _currentIndex;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.currentIndex);
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.blackColor.withOpacity(0.35),
      insetPadding: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Stack(
          children: [
            PositionedDirectional(
              top: 0,
              end: 0,
              child: GestureDetector(
                onTap: () {
                  RoutingProvider.goBack();
                },
                child: Container(
                  width: 35.r,
                  height: 35.r,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.whiteColor),
                  child: Icon(
                    Icons.close,
                    color: AppColors.blackColor,
                    size: 15.r,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: 320.h,
                    width: 320.w,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.r),
                        child: _buildPhotoViewGallery()),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(width: 140.w, height: 35.h, child: _buildIndicator()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator() {
    if (widget.photos.isNotEmpty) {
      return CarouselSlider.builder(
        itemCount: widget.photos.length,
        itemBuilder: (BuildContext context, int index, _) {
          return PortfolioGalleryImageWidget(
            image: widget.photos[index],
            isSelected: index == _currentIndex,
            onImageTap: () => _pageController.jumpToPage(index),
          );
        },
        options: CarouselOptions(
          viewportFraction: 0.3,
          padEnds: false,
          enlargeCenterPage: false,
          enableInfiniteScroll: false,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          initialPage: _currentIndex,
        ),
      );
    } else {
      return Container();
    }
  }

  PhotoViewGallery _buildPhotoViewGallery() {
    return PhotoViewGallery.builder(
      itemCount: widget.photos.length,
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: CachedNetworkImageProvider(widget.photos[index]),
          minScale: PhotoViewComputedScale.covered,
          maxScale: PhotoViewComputedScale.covered,
        );
      },
      backgroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
      ),
      scrollPhysics: const BouncingScrollPhysics(),
      pageController: _pageController,
      onPageChanged: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}

class PortfolioGalleryImageWidget extends StatelessWidget {
  final String image;
  final VoidCallback onImageTap;
  final bool isSelected;

  const PortfolioGalleryImageWidget(
      {Key? key,
      required this.image,
      required this.onImageTap,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 10.w),
      child: Opacity(
        opacity: isSelected ? 1 : 0.5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.r),
          child: GestureDetector(
              onTap: onImageTap,
              child: CustomNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }
}
