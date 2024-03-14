import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/screens/user_home_screen/presentation/widgets/category_list_item.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../constants/text_styles/text_styles.dart';
import '../../../../shared_widgets/custom_image_slider.dart';
import '../../business_logic/provider/guest_home_provider.dart';

class GuestHomeScreen extends StatefulWidget {
  const GuestHomeScreen({Key? key}) : super(key: key);

  @override
  State<GuestHomeScreen> createState() => _GuestHomeScreenState();
}

class _GuestHomeScreenState extends State<GuestHomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GuestHomeProvider>(context, listen: false).getCategories();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GuestHomeProvider>(builder: (context, guestHomeProvider, child) {
      if (guestHomeProvider.isLoading) {
        return const CustomProgressIndicator(color: AppColors.blackColor);
      } else if (guestHomeProvider.categories.isNotEmpty) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 15.h,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const CustomImageSlider()),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              'Categories',
              style: AppTextStyles.header2Inter,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            height: 400.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.w,
                  mainAxisSpacing: 20.h,
                  childAspectRatio: 2),
              itemBuilder: ((context, index) => CategoryListItem(
                    categoryModel: guestHomeProvider.categories[index],
                    categoryIndex: index,
                  )),
              itemCount: guestHomeProvider.categories.length,
              shrinkWrap: true,
            ),
          ),
        ]);
      } else {
        return Container();
      }
    });
  }
}
