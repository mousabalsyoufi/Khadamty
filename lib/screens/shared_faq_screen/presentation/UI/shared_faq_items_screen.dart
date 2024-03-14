import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/screens/shared_faq_screen/business_logic/provider/shared_faqs_provider.dart';
import 'package:faciltateur_de_vies/shared_models/shared_faq_model.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_appbar.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:faciltateur_de_vies/shared_widgets/faq_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SharedFaqItemsScreen extends StatefulWidget {
  const SharedFaqItemsScreen({super.key, required this.faqModel});

  final SharedFaqModel faqModel;

  @override
  State<SharedFaqItemsScreen> createState() => _SharedFaqItemsScreenState();
}

class _SharedFaqItemsScreenState extends State<SharedFaqItemsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SharedFaqsProvider>(context, listen: false)
          .getSharedFaqItems(id: widget.faqModel.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(widget.faqModel.label),
      body: Consumer<SharedFaqsProvider>(
          builder: (context, sharedFaqsProvider, child) {
        if (sharedFaqsProvider.isLoading) {
          return const CustomProgressIndicator(color: AppColors.blackColor);
        } else if (sharedFaqsProvider.faqItems.isNotEmpty) {
          return ListView.builder(
            padding: EdgeInsets.all(20.r),
            itemBuilder: (context, index) {
              return FAQCard(faqModel: sharedFaqsProvider.faqItems[index]);
            },
            itemCount: sharedFaqsProvider.faqItems.length,
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
