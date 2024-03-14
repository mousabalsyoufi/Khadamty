class StripeRequestRecurrentModel {
  String? paymentMethod;
  String? email;
  final int? cancelAt;
  final int intervalCount;
  final double price;


  StripeRequestRecurrentModel({this.paymentMethod, this.email,required this.cancelAt,
     required this.intervalCount,required this.price});



  Map<String, dynamic> toJson() {
    return {
      'paymentMethod': paymentMethod,
      'email': email,
      'cancelAt': cancelAt,
      'interval_count': intervalCount,
      'price': price,
    };
  }

  factory StripeRequestRecurrentModel.fromJson(Map<String, dynamic> map) {
    return StripeRequestRecurrentModel(
      paymentMethod: map['paymentMethod'] as String,
      email: map['email'] as String,
      cancelAt: map['cancelAt'] as int,
      intervalCount: map['interval_count'] as int,
      price: map['price'] as double,
    );
  }



  @override
  String toString() {
    return 'StripeRecurrentModel{paymentMethod: $paymentMethod, email: $email, cancelAt: $cancelAt, intervalCount: $intervalCount, price: $price}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is StripeRequestRecurrentModel &&
              runtimeType == other.runtimeType &&
              paymentMethod == other.paymentMethod &&
              email == other.email &&
              cancelAt == other.cancelAt &&
              intervalCount == other.intervalCount &&
              price == other.price;

  @override
  int get hashCode =>
      paymentMethod.hashCode ^
      email.hashCode ^
      cancelAt.hashCode ^
      intervalCount.hashCode ^
      price.hashCode;

  StripeRequestRecurrentModel copyWith({
    String? paymentMethod,
    String? email,
    int? cancelAt,
    int? intervalCount,
    double? price,
  }) {
    return StripeRequestRecurrentModel(
      paymentMethod: paymentMethod ?? this.paymentMethod,
      email: email ?? this.email,
      cancelAt: cancelAt ?? this.cancelAt,
      intervalCount: intervalCount ?? this.intervalCount,
      price: price ?? this.price,
    );
  }
}