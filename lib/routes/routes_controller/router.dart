import 'package:faciltateur_de_vies/core/local_storage/storage_manager.dart';
import 'package:faciltateur_de_vies/screens/business_user_account_details_screen/presentaion/UI/business_user_account_details_screen.dart';
import 'package:faciltateur_de_vies/screens/easer_bonus_screen/presentation/UI/easer_bonus_screen.dart';
import 'package:faciltateur_de_vies/screens/easer_dashboard_screen/presentation/UI/easer_dashboard_screen.dart';
import 'package:faciltateur_de_vies/screens/easer_personal_data_screen/presentation/UI/easer_personal_data_screen.dart';
import 'package:faciltateur_de_vies/screens/easer_scan_screen/presentation/UI/easer_scan_screen.dart';
import 'package:faciltateur_de_vies/screens/easer_service_details_screen/presentation/UI/easer_service_details_screen.dart';
import 'package:faciltateur_de_vies/screens/easer_service_process_screen/presentation/UI/main_service_process_screen.dart';
import 'package:faciltateur_de_vies/screens/easer_settings_screen/presentation/UI/easer_settings_screen.dart';
import 'package:faciltateur_de_vies/screens/forget_password_screen/presentation/UI/forget_password_screen.dart';
import 'package:faciltateur_de_vies/screens/login_screen/presentation/UI/login_screen.dart';
import 'package:faciltateur_de_vies/screens/main_screen/presentation/UI/main_screen.dart';
import 'package:faciltateur_de_vies/screens/payment_method_module/presentaion/UI/paypal_payment_method.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/presentation/UI/otp_verification_screen.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/presentation/UI/register_screen.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/presentation/UI/shared_chat_screen.dart';
import 'package:faciltateur_de_vies/screens/shared_faq_screen/presentation/UI/shared_faq_items_screen.dart';
import 'package:faciltateur_de_vies/screens/shared_faq_screen/presentation/UI/shared_faq_screen.dart';
import 'package:faciltateur_de_vies/screens/shared_help_form_screen/presentation/UI/shared_help_form_screen.dart';
import 'package:faciltateur_de_vies/screens/shared_notifications_screen/presentation/UI/notifications_screen.dart';
import 'package:faciltateur_de_vies/screens/shared_offer_details_screen/presentation/UI/shared_offer_details_screen.dart';
import 'package:faciltateur_de_vies/screens/shared_service_details_screen/data/models/service_details_model.dart';
import 'package:faciltateur_de_vies/screens/shared_terms_and_use_screen/presentation/UI/shared_terms_and_conditions_screen.dart';
import 'package:faciltateur_de_vies/screens/user_add_address_screen/presentation/UI/user_add_address_screen.dart';
import 'package:faciltateur_de_vies/screens/user_addresses_screen/presentation/UI/user_addresses_screen.dart';
import 'package:faciltateur_de_vies/screens/user_area_not_covered_screen/presentation/UI/user_area_not_covered_screen.dart';
import 'package:faciltateur_de_vies/screens/user_become_employee_screen/presentation/UI/become_employee_screen.dart';
import 'package:faciltateur_de_vies/screens/user_business_data_screen/presentation/UI/user_business_data_screeen.dart';
import 'package:faciltateur_de_vies/screens/user_offer_reservation_details_screen/presentation/UI/user_offer_reservation_details_screen.dart';
import 'package:faciltateur_de_vies/screens/user_personal_data_screen/presentation/UI/user_personal_data_screen.dart';
import 'package:faciltateur_de_vies/screens/user_points_screen/presentation/UI/user_points_screen.dart';
import 'package:faciltateur_de_vies/screens/user_recurrent_subscription_activation_process/presentation/UI/user_recurrent_subscription_activation_choose_recurrent_service_date_screen.dart';
import 'package:faciltateur_de_vies/screens/user_recurrent_subscription_activation_process/presentation/UI/user_recurrent_subscription_activation_pick_subscription_screen.dart';
import 'package:faciltateur_de_vies/screens/user_settings_screen/presentation/UI/user_settings_screen.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/presentation/UI/user_service_process_choose_service_frequency_screen.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/presentation/UI/user_service_process_shared_service_checkout_screen.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/presentation/UI/user_service_process_select_tasks_screen.dart';
import 'package:faciltateur_de_vies/screens/user_upcoming_one_time_service_details_screen/presentation/UI/user_upcoming_one_time_service_details_screen.dart';
import 'package:faciltateur_de_vies/shared_models/shared_faq_model.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

import '../../screens/easer_catalog_screen/presentation/UI/easer_catalog_screen.dart';
import '../../screens/easer_service_history_details_screen/presentation/UI/easer_service_history_details_screen.dart';
import '../../screens/shared_service_details_screen/presentation/UI/shared_service_details_screen.dart';
import '../../screens/user_add_address_map_screen/presentation/UI/user_add_address_map_screen.dart';
import '../../screens/user_business_service_checkout_screen/presentation/UI/user_business_service_checkout_screen.dart';
import '../../screens/user_offer_subscriber_screen/presentation/UI/user_main_offer_subscriber_screen.dart';
import '../../screens/user_report_issue_screen/presentation/UI/user_report_issue_screen.dart';
import '../../screens/user_service_history_details_screen/presentation/UI/user_service_history_details_screen.dart';
import '../../screens/user_subscribe_to_service_process/presentation/UI/user_service_process_add_address_screen.dart';
import '../../screens/user_subscribe_to_service_process/presentation/UI/user_service_process_one_time_service_date_screen.dart';
import '../../screens/user_subscribe_to_service_process/presentation/UI/user_service_process_recurrent_service_date_screen.dart';
import '../../screens/user_upcoming_recurrent_service_details_screen/presentation/UI/user_upcoming_recurrent_service_details_screen.dart';
import '../../screens/user_upcoming_reschedule_screen/presentation/UI/user_upcoming_reschedule_screen.dart';
import '../routes_names/routes_names.dart';
import 'package:flutter/material.dart';

import '../../screens/verify_mobile_number/presentation/UI/verify_mobile_number_screen.dart';
import '../../screens/welcome_screen_first/presentation/UI/welcome_screen_first.dart';
import '../../screens/welcome_screen_second/presentation/UI/welcome_screen_second.dart';

/// This Function to route manger to all screen ( handle all routing screen)
/// if you need to add a new screen should be add it here in this file.
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.base:
      bool? logged = StorageManager.getUserLoggedStatus();
      if (logged == null || logged == false) {
        return MaterialPageRoute(
            builder: (_) => const WelcomeScreenFirst(), settings: settings);
      } else {
        return MaterialPageRoute(
            builder: (_) => const MainScreen(), settings: settings);
      }
    case Routes.loginScreen:
      return MaterialPageRoute(
          builder: (_) => const LoginScreen(), settings: settings);
    case Routes.welcomeScreenFirst:
      return MaterialPageRoute(
          builder: (_) => const WelcomeScreenFirst(), settings: settings);
    case Routes.welcomeScreenSecond:
      return MaterialPageRoute(
          builder: (_) => const WelcomeScreenSecond(), settings: settings);
    case Routes.otpVerificationScreen:
      return MaterialPageRoute(
          builder: (_) => const OtpVerificationScreen(), settings: settings);
    case Routes.registerScreen:
      return MaterialPageRoute(
          builder: (_) => const RegisterScreen(), settings: settings);
    case Routes.verifyMobileNumberScreen:
      return MaterialPageRoute(
          builder: (_) => const VerifyMobileNumberScreen(), settings: settings);
    case Routes.forgetPasswordScreen:
      return MaterialPageRoute(
          builder: (_) => const ForgetPasswordScreen(), settings: settings);
    case Routes.mainScreen:
      return MaterialPageRoute(
          builder: (_) => const MainScreen(), settings: settings);
    case Routes.notificationsScreen:
      return MaterialPageRoute(
          builder: (_) => const NotificationScreen(), settings: settings);
    case Routes.easerPersonalDataScreen:
      return MaterialPageRoute(
          builder: (_) => EaserPersonalDataScreen(), settings: settings);
    case Routes.easerDashboardScreen:
      return MaterialPageRoute(
          builder: (_) => const EaserDashboardScreen(), settings: settings);
    case Routes.userAddressesScreen:
      return MaterialPageRoute(
          builder: (_) => const UserAddressesScreen(), settings: settings);
    case Routes.easerCatalogScreen:
      return MaterialPageRoute(
          builder: (_) => const EaserCatalogScreen(), settings: settings);
    case Routes.userPointsScreen:
      return MaterialPageRoute(
          builder: (_) => const UserPointsScreen(), settings: settings);
    case Routes.easerSettingsScreen:
      return MaterialPageRoute(
          builder: (_) => EaserSettingsScreen(), settings: settings);
    case Routes.userSettingsScreen:
      return MaterialPageRoute(
          builder: (_) => UserSettingsScreen(), settings: settings);
    case Routes.userBecomeEmployeeScreen:
      return MaterialPageRoute(
          builder: (_) => const UserBecomeEmployeeScreen(), settings: settings);
    case Routes.userPersonalDataScreeen:
      return MaterialPageRoute(
          builder: (_) => const UserPersonalDataScreen(), settings: settings);
    case Routes.easerbonusScreeen:
      return MaterialPageRoute(
          builder: (_) => const EaserBonusScreen(), settings: settings);
    case Routes.sharedFaqScreeen:
      return MaterialPageRoute(
          builder: (_) => const SharedFaqScreen(), settings: settings);
    case Routes.sharedFaqItemsScreeen:
      return MaterialPageRoute(
          builder: (_) => SharedFaqItemsScreen(
              faqModel: settings.arguments as SharedFaqModel),
          settings: settings);
    case Routes.sharedHelpFormScreeen:
      return MaterialPageRoute(
          builder: (_) => const SharedHelpFormScreen(), settings: settings);
    case Routes.sharedTermsAndConditionsScreeen:
      return MaterialPageRoute(
          builder: (_) => SharedTermsAndConditionsScreen(
              screenData: settings.arguments as Map<String, String>),
          settings: settings);
    case Routes.easerServiceDetailsScreen:
      return MaterialPageRoute(
          builder: (_) => EaserServiceDetailsScreen(
              serviceId: settings.arguments as String),
          settings: settings);
    case Routes.easerServiceHistoryDetailsScreen:
      return MaterialPageRoute(
          builder: (_) => EaserServiceHistoryDetailsScreen(
              serviceId: settings.arguments as String),
          settings: settings);
    case Routes.easerQrScanScreen:
      return MaterialPageRoute(
          builder: (_) => EaserScanScreen(
                isFirstScan: settings.arguments as bool,
              ),
          settings: settings);
    case Routes.sharedChatScreen:
      return MaterialPageRoute(
          builder: (_) => SharedChatScreen(
                chatHistory: settings.arguments as bool,
              ),
          settings: settings);
    case Routes.easerReportScreen:
      return MaterialPageRoute(
          builder: (builder) => const MainServiceProcessScreen(),
          settings: settings);
    case Routes.sharedServiceDetailsScreen:
      return MaterialPageRoute(
          builder: (builder) {
            Map<String, dynamic> arguments =
                settings.arguments as Map<String, dynamic>;
            return SharedServiceDetailsScreen(
              service: arguments['service'],
              color: arguments['color'],
            );
          },
          settings: settings);
    case Routes.userOfferDetailsScreen:
      return MaterialPageRoute(
          builder: (builder) {
            Map<String, dynamic> arguments =
                settings.arguments as Map<String, dynamic>;
            return SharedOfferDetailsScreen(
              service: arguments['service'],
              color: arguments['color'],
            );
          },
          settings: settings);
    case Routes.userOfferReservationDetailsScreen:
      return MaterialPageRoute(
          builder: (builder) => UserOfferReservationDetailsScreen(
                offerId: settings.arguments as String,
              ),
          settings: settings);
    case Routes.areaNotCoveredScreen:
      return MaterialPageRoute(
          builder: (builder) => const UserAreaNotCoveredScreen(),
          settings: settings);
    case Routes.userServiceSubscibeSelectTasksScreen:
      return MaterialPageRoute(
          builder: (builder) => UserServiceProcessSelectTasksScreen(
              serviceDetailsModel: settings.arguments as ServiceDetailsModel),
          settings: settings);
    case Routes.userServiceSubscibeChooseServiceFrequencyScreen:
      return MaterialPageRoute(
          builder: (builder) =>
               UserServiceProcessChooseServiceFrequencyScreen(),
          settings: settings);
    case Routes.userServiceSubscibeOneTimeServiceDateScreen:
      return MaterialPageRoute(
          builder: (builder) =>
              const UserServiceProcessOneTimeServiceDateScreen(),
          settings: settings);
    case Routes.userServiceSubscibeRecurrentServiceDateScreen:
      return MaterialPageRoute(
          builder: (builder) =>
              const UserServiceProcessRecurrentServiceDateScreen(),
          settings: settings);
    case Routes.userServiceSubscibeAddAddressScreen:
      return MaterialPageRoute(
          builder: (builder) => UserServiceProcessAddAddressScreen(),
          settings: settings);
    case Routes.userServiceSubscibeSharedServiceCheckoutScreen:
      return MaterialPageRoute(
          builder: (builder) =>
               UserServiceProcessSharedServiceCheckoutScreen(),
          settings: settings);
    case Routes.userUpcomingOneTimeServiceDetailsScreen:
      return MaterialPageRoute(
          builder: (builder) => UserUpcomingOneTimeServiceDetailsScreen(
                serviceId: settings.arguments as String,
              ),
          settings: settings);
    case Routes.userUpcomingRecurrentServiceDetailsScreen:
      return MaterialPageRoute(
          builder: (builder) => UserUpcomingRecurrentServiceDetailsScreen(
              serviceId: settings.arguments as String),
          settings: settings);
    case Routes.userRecurrentSubscriptionActivationChooseDateScreen:
      return MaterialPageRoute(
          builder: (builder) =>
              const UserRecurrentSubscriptionActivationChooseDateScreen(),
          settings: settings);
    case Routes.userRecurrentSubscriptionActivationPickSubscriptionScreen:
      return MaterialPageRoute(
          builder: (builder) =>
              const UserRecurrentSubscriptionActivationPickSubscriptionScreen(),
          settings: settings);
    case Routes.userMainOfferSubscriberScreen:
      return MaterialPageRoute(
          builder: (builder) {
            Map<String, dynamic> arguments =
                settings.arguments as Map<String, dynamic>;
            return UserMainOfferSubscriberScreen(
              offer: arguments['offer'],
              offerDetails: arguments['offerDetails'],
            );
          },
          settings: settings);
    // isRated : true , or false pass to show the rating
    // TODO remove parameter and build provider for that logic
    case Routes.userHistoryReviewScreen:
      return MaterialPageRoute(
          builder: (builder) {
             Map<String, dynamic> arguments =
                settings.arguments as Map<String, dynamic>;
            return UserServiceHistoryDetailsScreen(
              orderId: arguments['orderId'],
              serviceId: arguments['serviceId'],
            );
          },
          settings: settings);
    case Routes.userBusinessDataScreen:
      return MaterialPageRoute(
          builder: (builder) => UserBusinessDataScreen(), settings: settings);
    case Routes.userReportIssueScreen:
      return MaterialPageRoute(
          builder: (builder) => const UserReportIssueScreen(),
          settings: settings);
    case Routes.userBusinessServiceCheckoutScreen:
      return MaterialPageRoute(
          builder: (builder) => const UserBusinessServiceCheckoutScreen(),
          settings: settings);
    case Routes.userAddAddressScreen:
      return MaterialPageRoute(
          builder: (builder) => UserAddAddressScreen(
              pickedLocation: settings.arguments as PickResult),
          settings: settings);
    case Routes.userAddAddressMapScreen:
      return MaterialPageRoute(
          builder: (builder) => const UserAddAddressMapScreen(),
          settings: settings);
    case Routes.userUpcomingRescheduleScreen:
      return MaterialPageRoute(
          builder: (builder) => const UserUpcomingRescheduleScreen(),
          settings: settings);
    case Routes.businessUserAccountDetails:
      return MaterialPageRoute(
          builder: (builder) => BusinessUserAccountDetails(),
          settings: settings);
    case  Routes.paypal:
      Map<String, dynamic> arguments =
      settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(builder: (builder) => PayPalScreen(
        payPalRecurrentRequestModel: arguments['payPalRecurrentRequestModel'],
        payPalRequestModel: arguments['payPalRequestModel'] ,
      ), settings: settings);
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                  body: Center(
                child: Text("Page Not Found"),
              )),
          settings: settings);
  }
}
