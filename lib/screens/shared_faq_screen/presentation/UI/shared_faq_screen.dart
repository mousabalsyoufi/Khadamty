import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/screens/shared_faq_screen/business_logic/provider/shared_faqs_provider.dart';
import 'package:faciltateur_de_vies/screens/shared_faq_screen/presentation/UI/widgets/faq_list_item.dart';
import 'package:faciltateur_de_vies/shared_models/shared_faq_model.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_appbar.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../routes/routes_names/routes_names.dart';
import '../../../../routes/routes_provider/routes_provider.dart';


class SharedFaqScreen extends StatefulWidget {
  const SharedFaqScreen({super.key});

  @override
  State<SharedFaqScreen> createState() => _SharedFaqScreenState();
}

class _SharedFaqScreenState extends State<SharedFaqScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SharedFaqsProvider>(context, listen: false).getSharedFaqs();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('FAQ'),
      body: Consumer<SharedFaqsProvider>(
          builder: (context, sharedFaqsProvider, child) {
        if (sharedFaqsProvider.isLoading) {
          return const CustomProgressIndicator(color: AppColors.blackColor);
        } else if (sharedFaqsProvider.faqs.isNotEmpty) {
          return ListView.builder(
            padding: EdgeInsets.all(20.r),
            itemBuilder: (context, index) {
              SharedFaqModel faqModel = sharedFaqsProvider.faqs[index];
              return Column(
                children: [
                  GestureDetector(
                      onTap: (() {
                         RoutingProvider.pushNamed(
                            routeName: Routes.sharedFaqItemsScreeen,
                            arguments: faqModel);
                      }),
                      child: FaqListItem(faqModel: faqModel)),
                  SizedBox(height: 10.h)
                ],
              );
            },
            itemCount: sharedFaqsProvider.faqs.length,
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
