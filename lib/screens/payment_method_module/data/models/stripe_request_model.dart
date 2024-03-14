
class StripeRequestModel {

  final double? amount;

  final String? currency;

  late  String? paymentMethod;

  final bool? useStripeSdk;

  StripeRequestModel({this.amount, this.currency, this.paymentMethod, this.useStripeSdk});


  factory StripeRequestModel.fromJson(Map<String,dynamic> json){
    return StripeRequestModel(
      amount: json['amount'],
      currency: json['currency'],
      paymentMethod: json['payment_method'],
      useStripeSdk: json['use_stripe_sdk']
    );
  }


  Map<String,dynamic> toJson(){
    return {
      "amount":amount,
      "currency":currency,
      "payment_method":paymentMethod,
      "use_stripe_sdk":useStripeSdk,
    };
  }

}