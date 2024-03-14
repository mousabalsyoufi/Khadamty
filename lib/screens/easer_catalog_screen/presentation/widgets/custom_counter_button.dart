import 'package:faciltateur_de_vies/constants/colors/colors.dart';
import 'package:faciltateur_de_vies/screens/easer_catalog_screen/business_logic/provider/easer_catalog_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomCounterButton extends StatefulWidget {
  //there is two type one for add and another for min //when set the increase as true meaning add to catalog card
  final bool increase;
  final int catalogIndex;
  const CustomCounterButton({Key? key,required this.increase,required this.catalogIndex}) : super(key: key);

  @override
  State<CustomCounterButton> createState() => _CustomCounterButtonState();
}

class _CustomCounterButtonState extends State<CustomCounterButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(widget.increase) {
          Provider.of<EaserCatalogProvider>(context,listen: false).addToCatalog(widget.catalogIndex);
        } else {
          Provider.of<EaserCatalogProvider>(context,listen: false).removeFromCatalog(widget.catalogIndex);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyColor),
          color: widget.increase?AppColors.whiteColor:AppColors.greyColor,
          borderRadius: BorderRadius.circular(100.r)
        ),
        child: Icon(
          widget.increase?Icons.add : Icons.remove,
          size: 20.r,
        ),
      ),
    );
  }
}
