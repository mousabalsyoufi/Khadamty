import 'dart:io';

import 'package:faciltateur_de_vies/.env';
import 'package:faciltateur_de_vies/screens/easer_catalog_screen/business_logic/provider/easer_catalog_provider.dart';
import 'package:faciltateur_de_vies/screens/easer_help_screen/business_logic/provider/easer_help_provider.dart';
import 'package:faciltateur_de_vies/screens/easer_home_screen/business_logic/provider/easer_home_provider.dart';
import 'package:faciltateur_de_vies/screens/easer_service_details_screen/business_logic/provider/easer_service_details_provider.dart';
import 'package:faciltateur_de_vies/screens/easer_service_history_details_screen/business_logic/provider/easer_service_history_details_provider.dart';
import 'package:faciltateur_de_vies/screens/easer_service_process_screen/business_logic/provider/easer_report_provider.dart';
import 'package:faciltateur_de_vies/screens/easer_services_history_screen/business_logic/provider/easer_services_history_provider.dart';
import 'package:faciltateur_de_vies/screens/guest_home_screen.dart/business_logic/provider/guest_home_provider.dart';
import 'package:faciltateur_de_vies/screens/login_screen/business_logic/provider/login_provider.dart';
import 'package:faciltateur_de_vies/screens/main_screen/business_logic/provider/main_provider.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/bussiness_logic/provider/register_provider.dart';
import 'package:faciltateur_de_vies/screens/shared_chat_screen/business_logic/provider/shared_chat_provider.dart';
import 'package:faciltateur_de_vies/screens/shared_faq_screen/business_logic/provider/shared_faqs_provider.dart';
import 'package:faciltateur_de_vies/screens/shared_help_form_screen/business_logic/provider/shared_help_form_provider.dart';
import 'package:faciltateur_de_vies/screens/shared_notifications_screen/business_logic/provider/notifications_provider.dart';
import 'package:faciltateur_de_vies/screens/shared_service_details_screen/business_logic/shared_serivce_details_provider/shared_service_details_provider.dart';
import 'package:faciltateur_de_vies/screens/shared_services_categories_screen/business_logic/provider/shared_services_categories_provider.dart';
import 'package:faciltateur_de_vies/screens/user_add_address_screen/buainess_logic/provider/user_add_address_provider.dart';
import 'package:faciltateur_de_vies/screens/user_addresses_screen/business_logic/provider/user_addresses_provider.dart';
import 'package:faciltateur_de_vies/screens/user_become_employee_screen/business_logic/provider/become_an_employee_provider.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/business_logic/provider/user_bookings_provider.dart';
import 'package:faciltateur_de_vies/screens/user_home_screen/business_logic/provider/user_home_provider.dart';
import 'package:faciltateur_de_vies/screens/user_offer_reservation_details_screen/business_logic/user_offer_reservation_details_provider.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/business_logic/provider/user_profile_provider.dart';
import 'package:faciltateur_de_vies/screens/user_recurrent_subscription_activation_process/business_logic/provider/user_recurrent_subscription_activation_provider.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/business_logic/provider/user_offer_subscriber_provider.dart';
import 'package:faciltateur_de_vies/screens/user_service_history_details_screen/business_logic/provider/user_service_history_details_provider.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/business_logic/provider/user_service_subscribe_process_provider.dart';
import 'package:faciltateur_de_vies/screens/user_upcoming_one_time_service_details_screen/business_logic/provider/user_upcoming_one_time_service_details_provider.dart';
import 'package:faciltateur_de_vies/screens/user_upcoming_recurrent_service_details_screen/business_logic/provider/user_upcoming_recurrent_service_details_provider.dart';
import 'package:faciltateur_de_vies/screens/user_upcoming_reschedule_screen/business_logic/provider/user_upcoming_reschedule_provider.dart';
import 'package:faciltateur_de_vies/services/notification_service.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/history_rating_bottom_sheet/business_logic/rating_sheet_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';

import 'routes/routes_provider/routes_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'constants/themes/themes.dart';
import 'package:flutter/material.dart';

import 'core/singletons/singletons.dart';
import 'package:faciltateur_de_vies/routes/routes_controller/router.dart'
    as router;

import 'screens/easer_personal_data_screen/business_logic/provider/easer_personal_data_provider.dart';
import 'screens/payment_method_module/bussiness_logic/provider/payment_methods_provider.dart';
import 'screens/shared_offer_details_screen/business_logic/shared_offer_details_provider/shared_offer_details_provider.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    NotificationService.initializeNotifications();
  }
  Stripe.publishableKey = stripePublishableKey;
  await Stripe.instance.applySettings();
  await initSingletonInstances();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 760),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => getIt<MainProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<NotificationsProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<RatingSheetProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<EaserPersonalDataProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<EaserHelpProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<EaserHomeProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<EaserServicesHistoryProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<EaserServiceDetailsProvider>()),
            ChangeNotifierProvider(
                create: (context) =>
                    getIt<EaserServiceHistoryDetailsProvider>()),
            ChangeNotifierProvider(
                create: (context) =>
                    getIt<UserServiceHistoryDetailsProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<SharedServicesCategoriesProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<SharedChatProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<SharedFaqsProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<UserHomeProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<UserAddressesProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<GuestHomeProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<UserProfileProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<AddAddressProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<BecomeAnEmployeeProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<SharedHelpFormProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<EaserCatalogProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<EaserReportProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<SharedServiceDetailsProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<SharedOfferDetailsProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<SharedServicesCategoriesProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<EaserCatalogProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<EaserReportProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<RegisterProvider>()),
            ChangeNotifierProvider(create: (context) => getIt<LoginProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<UserOfferSubscriberProvider>()),
            ChangeNotifierProvider(
                create: (context) =>
                    getIt<UserOfferReservationDetailsProvider>()),
            ChangeNotifierProvider(
                create: (context) =>
                    getIt<UserServiceSubscribeProcessProvider>()),
            ChangeNotifierProvider(
                create: (context) =>
                    getIt<UserUpcomingOneTimeServiceDetailsProvider>()),
            ChangeNotifierProvider(
                create: (context) =>
                    getIt<UserUpcomingRecurrentServiceDetailsProvider>()),
            ChangeNotifierProvider(
                create: (context) =>
                    getIt<UserRecurrentSubscriptionActivationProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<UserUpcomingRescheduleProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<UserBookingsProvider>()),
            ChangeNotifierProvider(
                create: (context) => getIt<PaymentMethodProvider>())
          ],
          child: MaterialApp(
            title: 'FACILITATEUR DE VIES',
            theme: AppThemes.appTheme,
            debugShowCheckedModeBanner: false,
            navigatorKey: RoutingProvider.navigatorKey,
            onGenerateRoute: router.generateRoute,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('fr', ''),
              Locale('en', ''),
            ],
          ),
        );
      },
    );
  }
}
