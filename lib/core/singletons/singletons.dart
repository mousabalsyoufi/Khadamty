import 'package:faciltateur_de_vies/screens/user_profile_screen/data/data_source/upload_photo_provider/upload_photo_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/domain/usecase/upload_photo_usecase.dart';

import '../../screens/easer_service_history_details_screen/domain/usecase/get_easer_service_history_details_usecase.dart';
import '../../screens/user_upcoming_recurrent_service_details_screen/domain/usecase/get_upcoming_recurrent_service_details_usecase.dart';
// please add your import here if fail try to add here directly
import 'singletons_imports.dart';

final getIt = GetIt.instance;

// init http request "should be init in main file before run app"
initSingletonInstances() async {
  // Register Core Components like dio client
  await registerCoreComponents();

  // Register Api Calls
  registerApiCalls();

  // Register Repositories
  registerRepositoriesImp();

  // Register UseCases
  registerUseCases();

  // Register Providers
  registerProviders();
}

registerApiCalls() {
  getIt.registerLazySingleton(() => LoginApiImp());
  getIt.registerLazySingleton(() => UploadPhotoApiImp());
  getIt.registerLazySingleton(() => NotificationsApiImp());
  getIt.registerLazySingleton(() => CheckUserExistApiImp());
  getIt.registerLazySingleton(() => RegisterApiImp());
  getIt.registerLazySingleton(() => UserCategoriesApiImp());
  getIt.registerLazySingleton(() => UserAddressesApiImp());
  getIt.registerLazySingleton(() => DeleteAddressApiImp());
  getIt.registerLazySingleton(() => GuestCategoriesApiImp());
  getIt.registerLazySingleton(() => SharedFaqsApiImp());
  getIt.registerLazySingleton(() => SharedFaqItemsApiImp());
  getIt.registerLazySingleton(() => CategoryServicesApiImp());
  getIt.registerLazySingleton(() => TicketsApiImp());
  getIt.registerLazySingleton(() => SendChatTicketApiImp());
  getIt.registerLazySingleton(() => ServiceDetailsApiImp());
  getIt.registerLazySingleton(() => OfferDetailsApiImp());
  getIt.registerLazySingleton(() => OfferReservationDetailsApiImp());
  getIt.registerLazySingleton(() => SubscribeToServiceApiImp());
  getIt.registerLazySingleton(() => SubscribeWithSubscriptionApiImp());
  getIt.registerLazySingleton(() => SaveServiceApiImp());
  getIt.registerLazySingleton(() => SubscribeToOfferApiImp());
  getIt.registerLazySingleton(() => ServiceReservationDetailsApiImp());
  getIt.registerLazySingleton(() => RecurrentServiceReservationDetailsApiImp());
  getIt.registerLazySingleton(() => OffersApiImp());
  getIt.registerLazySingleton(() => CategoriesApiImp());
  getIt.registerLazySingleton(() => VerifyOtpApiImp());
  getIt.registerLazySingleton(() => SendOtpApiImp());
  getIt.registerLazySingleton(() => DeleteAccountApiImp());
  getIt.registerLazySingleton(() => AddAddressApiImp());
  getIt.registerLazySingleton(() => BecomeAnEmployeeApiImp());
  getIt.registerLazySingleton(() => HelpTicketApiImp());
  getIt.registerLazySingleton(() => GetAccountApiImp());
  getIt.registerLazySingleton(() => GetEaserAccountApiImp());
  getIt.registerLazySingleton(() => UpdateAccountApiImp());
  getIt.registerLazySingleton(() => ForgetPasswordApiImp());
  getIt.registerLazySingleton(() => VerifyMobileNumberApiImp());
  getIt.registerLazySingleton(() => UpcomingOrdersApiImp());
  getIt.registerLazySingleton(() => HistoryOrdersApiImp());
  getIt.registerLazySingleton(() => CreatePaymentStripeApiImp());
  getIt.registerLazySingleton(() => ConfirmPaymentStripeApiImp());
  getIt.registerLazySingleton(() => CreateRecurrentPaymentStripeApiImp());
  getIt.registerLazySingleton(() => RegisterCompanyApiImp());
  getIt.registerLazySingleton(() => RatingApiImp());
  getIt.registerLazySingleton(() => ServiceHistoryDetailsApiImp());
  getIt.registerLazySingleton(() => EquipmentCatalogApiImp());
  getIt.registerLazySingleton(() => EquipmentRequestApiImp());
  getIt.registerLazySingleton(() => EaserFaqsApiImp());
  getIt.registerLazySingleton(() => EaserUpcomingServicesApiImp());
  getIt.registerLazySingleton(() => EaserServicesHistoryApiImp());
  getIt.registerLazySingleton(() => EaserServiceDetailsApiImp());
  getIt.registerLazySingleton(() => EaserServiceHistoryDetailsApiImp());
}

registerRepositoriesImp() {
  getIt.registerLazySingleton(() => LoginRepositoryImp(getIt()));
  getIt.registerLazySingleton(
      () => NotificationsRepositoryImp(notificationsApiImp: getIt()));
  getIt.registerLazySingleton(() => RegisterRepositoryImp(
      registerCompanyImp: getIt(),
      registerImp: getIt(),
      verifyOtpImp: getIt(),
      sendOtpApiImp: getIt(),
      checkUserExistApiImp: getIt()));
  getIt.registerLazySingleton(() => UserHomeRepositoryImp(
        categoriesApiImp: getIt(),
      ));
  getIt.registerLazySingleton(() => UserAddressesRepositoryImp(
        userAddressesApiImp: getIt(),
        deleteAddressApiImp: getIt(),
      ));
  getIt.registerLazySingleton(() => GuestHomeRepositoryImp(
        categoriesApiImp: getIt(),
      ));
  getIt.registerLazySingleton(() => SharedFaqsRepositoryImp(
      sharedFaqsApiImp: getIt(), sharedFaqItemsApiImp: getIt()));
  getIt.registerLazySingleton(() => ServiceDetailsRepositoryImp(
        getIt(),
      ));
  getIt.registerLazySingleton(() => OfferDetailsRepositoryImp(
        getIt(),
      ));
  getIt.registerLazySingleton(() => SubscribeToServiceRepositoryImp(
        getIt(),
        getIt(),
        getIt(),
      ));
  getIt.registerLazySingleton(
      () => UserProfileRepositoryImp(getIt(), getIt(), getIt(), getIt()));
  getIt.registerLazySingleton(() => AddAddressRepositoryImp(
        getIt(),
      ));
  getIt.registerLazySingleton(() => BecomeAnEmployeeRepositoryImp(
        getIt(),
      ));
  getIt.registerLazySingleton(() => SharedHelpFormRepositoryImp(
        getIt(),
      ));
  getIt.registerLazySingleton(() => SubscribeToOfferRepositoryImp(
        getIt(),
      ));
  getIt.registerLazySingleton(
      () => UserUpcomingOneTimeServiceDetailsRepositoryImp(
            serviceReservationDetailsApiImp: getIt(),
          ));
  getIt.registerLazySingleton(
      () => UserUpcomingRecurrentServiceDetailsRepositoryImp(
            serviceReservationDetailsApiImp: getIt(),
          ));
  getIt.registerLazySingleton(() => UserOfferReservationDetailsRepositoryImp(
        offerReservationDetailsApiImp: getIt(),
      ));
  getIt.registerLazySingleton(() => SharedChatRepositoryImp(
        ticketsApiImp: getIt(),
        sendChatTicketApiImp: getIt(),
      ));
  getIt.registerLazySingleton(() => SharedServicesCategoriesRepositoryImp(
      categoriesApiImp: getIt(),
      categoryServicesApiImp: getIt(),
      offersApiImp: getIt()));
  getIt.registerLazySingleton(() => ForgetPasswordRepositoryImp(getIt()));
  getIt.registerLazySingleton(() => VerifyMobileNumberRepositoryImp(getIt()));
  getIt
      .registerLazySingleton(() => UserBookingsRepositoryImp(getIt(), getIt()));
  getIt.registerLazySingleton(
      () => PaymentMethodRepositoryImp(getIt(), getIt(), getIt()));
  getIt.registerLazySingleton(() => RatingRepositoryImp(getIt()));
  getIt.registerLazySingleton(() =>
      ServiceHistoryDetailsRepositoryImp(serviceHistoryDetailsApiImp: getIt()));
  getIt.registerLazySingleton(() => EaserPersonalDataRepositoryImp(getIt()));
  getIt.registerLazySingleton(() => EaserCatalogRepositoryImp(
      equipmentCatalogApiImp: getIt(), equipmentRequestApiImp: getIt()));
  getIt.registerLazySingleton(
      () => EaserHelpRepositoryImp(easerFaqsApiImp: getIt()));
  getIt.registerLazySingleton(() => EaserHomeRepositoryImp(getIt()));
  getIt.registerLazySingleton(() => EaserServicesHistoryRepositoryImp(getIt()));
  getIt.registerLazySingleton(() =>
      EaserServiceDetailsRepositoryImp(easerServiceDetailsApiImp: getIt()));
  getIt.registerLazySingleton(() => EaserServiceHistoryDetailsRepositoryImp(
      easerServiceHistoryDetailsApiImp: getIt()));
}

registerUseCases() {
  getIt.registerLazySingleton(() => LoginUseCase(getIt<LoginRepositoryImp>()));
  getIt.registerLazySingleton(
      () => GetNotificationsUseCase(getIt<NotificationsRepositoryImp>()));
  getIt.registerLazySingleton(
      () => RegisterUseCase(getIt<RegisterRepositoryImp>()));
  getIt.registerLazySingleton(
      () => RegisterCompanyUseCase(getIt<RegisterRepositoryImp>()));
  getIt.registerLazySingleton(
      () => CheckUserExistUseCase(getIt<RegisterRepositoryImp>()));
  getIt.registerLazySingleton(
      () => GetUserCategoriesUseCase(getIt<UserHomeRepositoryImp>()));
  getIt.registerLazySingleton(
      () => GetGuestCategoriesUseCase(getIt<GuestHomeRepositoryImp>()));
  getIt.registerLazySingleton(
      () => GetSharedFaqsUseCase(getIt<SharedFaqsRepositoryImp>()));
  getIt.registerLazySingleton(
      () => GetSharedFaqItemsUseCase(getIt<SharedFaqsRepositoryImp>()));
  getIt.registerLazySingleton(
      () => GetServiceDetailsUseCase(getIt<ServiceDetailsRepositoryImp>()));
  getIt.registerLazySingleton(
      () => GetOfferDetailsUseCase(getIt<OfferDetailsRepositoryImp>()));
  getIt.registerLazySingleton(() =>
      SubscribeToServiceUseCase(getIt<SubscribeToServiceRepositoryImp>()));
  getIt.registerLazySingleton(() => SubscribeWithSubscriptionUseCase(
      getIt<SubscribeToServiceRepositoryImp>()));
  getIt.registerLazySingleton(
      () => SaveServiceUseCase(getIt<SubscribeToServiceRepositoryImp>()));
  getIt.registerLazySingleton(
      () => SubscribeToOfferUseCase(getIt<SubscribeToOfferRepositoryImp>()));
  getIt.registerLazySingleton(() => GetUpcomingServiceDetailsUseCase(
      getIt<UserUpcomingOneTimeServiceDetailsRepositoryImp>()));
  getIt.registerLazySingleton(() => GetUpcomingRecurrentServiceDetailsUseCase(
      getIt<UserUpcomingRecurrentServiceDetailsRepositoryImp>()));
  getIt.registerLazySingleton(() => GetOfferReservationDetailsUseCase(
      getIt<UserOfferReservationDetailsRepositoryImp>()));
  getIt.registerLazySingleton(() => GetCategoryServicesUseCase(
      getIt<SharedServicesCategoriesRepositoryImp>()));
  getIt.registerLazySingleton(
      () => GetOffersUseCase(getIt<SharedServicesCategoriesRepositoryImp>()));
  getIt.registerLazySingleton(() =>
      GetCategoriesUseCase(getIt<SharedServicesCategoriesRepositoryImp>()));
  getIt.registerLazySingleton(
      () => GetUserAddressesUseCase(getIt<UserAddressesRepositoryImp>()));
  getIt.registerLazySingleton(
      () => DeleteAddressUseCase(getIt<UserAddressesRepositoryImp>()));
  getIt.registerLazySingleton(
      () => GetTicketsUseCase(getIt<SharedChatRepositoryImp>()));
  getIt.registerLazySingleton(
      () => SendChatTicketUseCase(getIt<SharedChatRepositoryImp>()));
  getIt.registerLazySingleton(
      () => SendOtpUseCase(getIt<RegisterRepositoryImp>()));
  getIt.registerLazySingleton(
      () => DeleteUserAccountUseCase(getIt<UserProfileRepositoryImp>()));
  getIt.registerLazySingleton(
      () => UploadPhotoUseCase(getIt<UserProfileRepositoryImp>()));
  getIt.registerLazySingleton(
      () => AddAddressUseCase(getIt<AddAddressRepositoryImp>()));
  getIt.registerLazySingleton(
      () => BecomeAnEmployeeUseCase(getIt<BecomeAnEmployeeRepositoryImp>()));
  getIt.registerLazySingleton(
      () => HelpTicketUseCase(getIt<SharedHelpFormRepositoryImp>()));
  getIt.registerLazySingleton(
      () => GetAccountUseCase(getIt<UserProfileRepositoryImp>()));
  getIt.registerLazySingleton(
      () => UpdateAccountUseCase(getIt<UserProfileRepositoryImp>()));
  getIt.registerLazySingleton(
      () => VerifyOtpUseCase(getIt<RegisterRepositoryImp>()));
  getIt.registerLazySingleton(() => ForgetPasswordUseCase(getIt()));
  getIt.registerLazySingleton(() => VerifyMobileNumberUseCase(getIt()));
  getIt.registerLazySingleton(
      () => UpcomingOrdersUseCase(getIt<UserBookingsRepositoryImp>()));
  getIt.registerLazySingleton(
      () => HistoryOrdersUseCase(getIt<UserBookingsRepositoryImp>()));
  getIt.registerLazySingleton(
      () => CreateStripeUseCase(getIt<PaymentMethodRepositoryImp>()));
  getIt.registerLazySingleton(
      () => CreateRecurrentStripeUseCase(getIt<PaymentMethodRepositoryImp>()));
  getIt.registerLazySingleton(
      () => ConfirmStripeUseCase(getIt<PaymentMethodRepositoryImp>()));
  getIt
      .registerLazySingleton(() => RatingUseCase(getIt<RatingRepositoryImp>()));

  getIt.registerLazySingleton(() => GetServiceHistoryDetailsUseCase(
      getIt<ServiceHistoryDetailsRepositoryImp>()));
  getIt.registerLazySingleton(
      () => GetEaserAccountUseCase(getIt<EaserPersonalDataRepositoryImp>()));
  getIt.registerLazySingleton(
      () => GetEaserCatalogsUseCase(getIt<EaserCatalogRepositoryImp>()));
  getIt.registerLazySingleton(
      () => EquipmentRequestUseCase(getIt<EaserCatalogRepositoryImp>()));
  getIt.registerLazySingleton(
      () => GetEaserFaqsUseCase(getIt<EaserHelpRepositoryImp>()));
  getIt.registerLazySingleton(
      () => GetEaserUpcomingServicesUseCase(getIt<EaserHomeRepositoryImp>()));
  getIt.registerLazySingleton(() => GetEaserServicesHistoryUseCase(
      getIt<EaserServicesHistoryRepositoryImp>()));
  getIt.registerLazySingleton(() =>
      GetEaserServiceDetailsUseCase(getIt<EaserServiceDetailsRepositoryImp>()));
  getIt.registerLazySingleton(() => GetEaserServiceHistoryDetailsUseCase(
      getIt<EaserServiceHistoryDetailsRepositoryImp>()));
}

registerProviders() {
  getIt.registerLazySingleton(() => LoginProvider(getIt()));
  getIt.registerLazySingleton(() => NotificationsProvider(getIt()));
  getIt.registerLazySingleton(() => RegisterProvider(
        registerCompanyUseCase: getIt(),
        registerUseCase: getIt(),
        sendOtpUseCase: getIt(),
        verifyOtpUseCase: getIt(),
        checkUserExistUseCase: getIt(),
      ));
  getIt.registerLazySingleton(() => UserHomeProvider(getIt()));
  getIt.registerLazySingleton(() => UserAddressesProvider(getIt(), getIt()));
  getIt.registerLazySingleton(() => GuestHomeProvider(getIt()));
  getIt.registerLazySingleton(() => AddAddressProvider(getIt()));
  getIt.registerLazySingleton(() => BecomeAnEmployeeProvider(getIt()));
  getIt.registerLazySingleton(() => SharedHelpFormProvider(getIt()));
  getIt.registerLazySingleton(() => SharedFaqsProvider(getIt(), getIt()));
  getIt.registerLazySingleton(
      () => UserProfileProvider(getIt(), getIt(), getIt(), getIt()));
  getIt.registerLazySingleton(() => ForgetPasswordProvider(getIt()));
  getIt.registerLazySingleton(() => SharedChatProvider(getIt(), getIt()));
  getIt.registerLazySingleton(() => VerifyMobileNumberProvider(getIt()));
  getIt.registerLazySingleton(() => MainProvider());
  getIt.registerLazySingleton(
      () => SharedServicesCategoriesProvider(getIt(), getIt(), getIt()));
  getIt.registerLazySingleton(() => EaserCatalogProvider(getIt(), getIt()));
  getIt.registerLazySingleton(() => EaserReportProvider());
  getIt.registerLazySingleton(() => SharedServiceDetailsProvider(getIt()));
  getIt.registerLazySingleton(() => SharedOfferDetailsProvider(getIt()));
  getIt.registerLazySingleton(
      () => UserUpcomingOneTimeServiceDetailsProvider(getIt()));
  getIt.registerLazySingleton(
      () => UserUpcomingRecurrentServiceDetailsProvider(getIt()));
  getIt.registerLazySingleton(() => UserOfferSubscriberProvider(getIt()));
  getIt.registerLazySingleton(
      () => UserOfferReservationDetailsProvider(getIt()));
  getIt.registerLazySingleton(
      () => UserServiceSubscribeProcessProvider(getIt(), getIt(), getIt()));
  getIt.registerLazySingleton(
      () => UserRecurrentSubscriptionActivationProvider());
  getIt.registerLazySingleton(() => UserUpcomingRescheduleProvider());
  getIt.registerLazySingleton(() => UserBookingsProvider(getIt(), getIt()));
  getIt.registerLazySingleton(
      () => PaymentMethodProvider(getIt(), getIt(), getIt()));
  getIt.registerLazySingleton(() => RatingSheetProvider(getIt()));
  getIt.registerLazySingleton(() => UserServiceHistoryDetailsProvider(getIt()));
  getIt.registerLazySingleton(() => EaserPersonalDataProvider(getIt()));
  getIt.registerLazySingleton(() => EaserHelpProvider(getIt()));
  getIt.registerLazySingleton(() => EaserHomeProvider(getIt()));
  getIt.registerLazySingleton(() => EaserServicesHistoryProvider(getIt()));
  getIt.registerLazySingleton(() => EaserServiceDetailsProvider(getIt()));
  getIt
      .registerLazySingleton(() => EaserServiceHistoryDetailsProvider(getIt()));
}

registerCoreComponents() async {
  getIt.registerSingleton<Dio>(getHttpClient());

  // create and register the shared prefrences object
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);

  // create and register the secure storage object
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  getIt.registerLazySingleton(() => secureStorage);
}
