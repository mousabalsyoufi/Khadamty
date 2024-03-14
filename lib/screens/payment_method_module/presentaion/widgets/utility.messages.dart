import 'package:faciltateur_de_vies/core/utility/utility.dart';

class PaymentUtility{

  // function to show message in screen in case of the payment is not completed
  static errorMessage({String message = 'Error!: The Payment not completed'}){
    Utility.showToast(message: message);
  }

  // function to show message in screen in case of the payment is completed

  static successMessage({String message = 'Success!: The payment was confirmed successfully!'}){
    Utility.showToast(message: message);
  }

}