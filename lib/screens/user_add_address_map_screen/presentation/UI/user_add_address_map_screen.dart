import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_button_black.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../routes/routes_names/routes_names.dart';
import '../../../../shared_widgets/custom_appbar.dart';
import '../widgets/google_map_widget.dart';

class UserAddAddressMapScreen extends StatelessWidget {
  const UserAddAddressMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Add Address"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            const CustomTextField(hint: 'Your address'),
            SizedBox(
              height: 20.h,
            ),
            Expanded(child: GoogleMapWidget()),
            SizedBox(
              height: 20.h,
            ),
            CustomButtonBlack(
                buttonContent: const Text('Confirm')  ,
                onPressed: () {
                  RoutingProvider.pushNamed(
                      routeName: Routes.userAddAddressScreen);
                }),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
