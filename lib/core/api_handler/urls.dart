class Urls {
  // base url of the backend server development
  static const baseUrl = 'https://fdvgateway.itfaq.cloud/api/';
  // base url of the backend server UAT
  //static const baseUrl = 'https://fdvgtuat.itfaq.cloud/api/';

  static const login = '${baseUrl}user/login';
  static const uploadPhoto = '${baseUrl}document/profile-photo';
  static const checkUserExist = '${baseUrl}user/isUser';
  static const changeUserAccountStatus = '${baseUrl}user/changeStatus';
  static const register = '${baseUrl}user/register';
  static const registerCompany = '${baseUrl}user/register/company';
  static const categories = '${baseUrl}categories/categories';
  static const notifications = '${baseUrl}notification';
  static const userMainFaqs = '${baseUrl}categories/faqs';
  static const userSubFaqs = '${baseUrl}categories';
  static const categoriesWithOffers = '${baseUrl}categories/all';
  static const offers = '${baseUrl}categories/offers';
  static const categoryServices = '${baseUrl}productsByCategoryId';
  static const serviceDetails = '${baseUrl}serviceDetails';
  static const offerDetails = '${baseUrl}serviceOfferDetails';
  static const sendOtp = '${baseUrl}sms/V2/otp/send';
  static const verifyOtp = '${baseUrl}sms/V2/otp/verify';
  static const subscribeToService = '${baseUrl}order/create/service';
  static const subscribeToServiceWithSubscription = '${baseUrl}order/create/subscription';
  static const saveServiceDB = '${baseUrl}order/save/service';
  static const subscribeToOffer = '${baseUrl}order/create/offer';
  static const serviceAndOfferReservationDetails =
      '${baseUrl}order/orderDetails';
  static const tickets = '${baseUrl}tickets';
  static const becomeAnEmployee = '${baseUrl}tickets/becomeAnEmployee';
  static const helpTicket = '${baseUrl}tickets/helpTicket';
  static const updateAddress = '${baseUrl}contacts';
  static const addAddress = '${baseUrl}contact';
  static const userAddresses = '${baseUrl}contacts';
  static const deleteAddress = '${baseUrl}contacts';
  static const forgetPassword = '';
  static const verifyMobileNumber = '';

  // services images URL
  static const servicesImagesBaseURL =
      'http://www.erp.dev.facilitateurdevies.com/document.php?hashp=';

  // get account information
  static const getAccount = '${baseUrl}user/user/info';

  // update account info
  static updateAccount(int id) => '${baseUrl}user/$id';

  // rate service url
  static serviceRating(String orderId, String serviceId) =>
      '${baseUrl}order/rating/$orderId/$serviceId';

  // upcoming order url for users
  static const upcomingOrders = '${baseUrl}order/upcomming';

  // upcoming order url for easers
  static const easerUpcomingOrders = '${baseUrl}order/easer/upcomming';

  // history order url
  static const historyOrders = '${baseUrl}order/history';

  /// stripe urls [Create , Confirm ]
  static const createStripe = '${baseUrl}payments/stripe/create';
  static const confirmStripe = '${baseUrl}payments/stripe/confirm';

  // easer equipment catalog
  static const equipementCatalog = '${baseUrl}categoires/catalogue';

  // easer faqs
  static const easerFaqs = '${baseUrl}categoires/easerFaqs';

  // send equipment request
  static const equipementCatalogRequest =
      '${baseUrl}tickets/createOrderEquipment';

  // recurrent stripe payment
  static const createRecurrentStripe = '${baseUrl}payments/stripe/subscription';

  // url payPal subscription base
  static const createPaypalSubscription =
      '${baseUrl}payments/paypal/createPaypalSubscription';
  // url payPal  base
  static const createPayPal = '${baseUrl}payments/paypal';
}
