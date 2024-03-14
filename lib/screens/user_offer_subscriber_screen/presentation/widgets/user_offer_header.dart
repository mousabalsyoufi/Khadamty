import 'package:faciltateur_de_vies/constants/enums/user_offer_enum.dart';
import 'package:faciltateur_de_vies/constants/icons/icons.dart';
import 'package:faciltateur_de_vies/routes/routes_provider/routes_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../../../../constants/colors/colors.dart';
import '../../../../routes/routes_names/routes_names.dart';
import '../../business_logic/provider/user_offer_subscriber_provider.dart';

class UserOfferSubscriberHeaderWidget extends StatelessWidget {
  const UserOfferSubscriberHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserOfferSubscriberProvider provider = Provider.of<UserOfferSubscriberProvider>(context);
    return Selector<UserOfferSubscriberProvider,double>(
      selector: (BuildContext context,value)=>value.percent,
      builder: (BuildContext context, double percent, _) {
        return Column(
          children: [
            Row(
              children: [
                 CustomBackButton(callBack: (){
                   if(provider.percent > 0.2){
                      provider.changePercentBack();
                   }else{
                     RoutingProvider.goBack();
                   }
                },),
                SizedBox(
                  width: 17.w,
                ),
                SizedBox(
                  height: 10.h,
                  width: 216.w,
                  child: LinearPercentIndicator(
                    padding: EdgeInsets.zero,
                    animation: false,
                    lineHeight: 25.h,
                    animationDuration: 2500,
                    percent: percent,
                    backgroundColor: AppColors.whiteColor,
                    barRadius: Radius.circular(15.r),
                    progressColor: AppColors.greenColor,
                  ),
                ),
                const Spacer(),
                if(provider.userOfferSubscriberStepStatus == UserOfferSubscriber.selectRepeatPatternStep)
                  InkWell(
                      onTap: (){
                        RoutingProvider.pushNamed(routeName: Routes.sharedFaqScreeen);
                      },
                      child: SvgPicture.asset(AppIcons.questionBubbleIcon,height: 35.h,width: 35.w,fit: BoxFit.cover,)),
                if(provider.userOfferSubscriberStepStatus == UserOfferSubscriber.detailsServiceStep)
                  SvgPicture.asset(AppIcons.refreshIcon,height: 20.h,width: 20.w,fit: BoxFit.cover,),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        );
      },
    );
  }
}
