import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/screens/easer_catalog_screen/business_logic/provider/easer_catalog_provider.dart';
import 'package:faciltateur_de_vies/screens/easer_catalog_screen/data/model/catalog_model_fake.dart';
import 'package:faciltateur_de_vies/screens/easer_catalog_screen/presentation/widgets/catalog_card.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../shared_widgets/custom_appbar.dart';
import '../../data/model/catalog_model.dart';

class EaserCatalogScreen extends StatefulWidget {
  const EaserCatalogScreen({Key? key}) : super(key: key);

  @override
  State<EaserCatalogScreen> createState() => _EaserCatalogScreenState();
}

class _EaserCatalogScreenState extends State<EaserCatalogScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<EaserCatalogProvider>(context, listen: false).getCatalogs();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Catalog"),
      body: Consumer<EaserCatalogProvider>(
        builder: (BuildContext context, provider, _) {
          if (provider.isLoading) {
            return const CustomProgressIndicator(color: AppColors.blackColor);
          } else if (provider.catalogs.isNotEmpty) {
            return ListView.builder(
              padding:
                  EdgeInsetsDirectional.only(start: 20.w, end: 20.w, top: 25.h),
              itemCount: provider.catalogs.length,
              itemBuilder: (BuildContext context, int index) {
                CatalogModel catalog = provider.catalogs[index];
                return Padding(
                  padding: EdgeInsetsDirectional.only(bottom: 15.h),
                  child:
                      CatalogCardWidget(catalog: catalog, catalogIndex: index),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
