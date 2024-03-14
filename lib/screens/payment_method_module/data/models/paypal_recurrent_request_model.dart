class PayPalRecurrentRequestModel {

  final String currency;
  final String amount;
  final String cycle;
  final String url;
  PayPalRecurrentRequestModel({required this.currency,required this.amount,required this.cycle,required this.url});

  Map<String, dynamic> toMap() {
    return {
      'currency': currency,
      'amount': amount,
      'cycle': cycle,
      'url':url,
    };
  }

  factory PayPalRecurrentRequestModel.fromMap(Map<String, dynamic> map) {
    return PayPalRecurrentRequestModel(
      url: map['url'] as String,
      currency: map['currency'] as String,
      amount: map['amount'] as String,
      cycle: map['cycle'] as String,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PayPalRecurrentRequestModel &&
          runtimeType == other.runtimeType &&
          currency == other.currency &&
          amount == other.amount &&
          url == other.url &&
          cycle == other.cycle;

  @override
  int get hashCode => currency.hashCode ^ amount.hashCode ^ cycle.hashCode ^ url.hashCode;

  @override
  String toString() {
    return 'PayPalRecurrentRequestModel{currency: $currency, amount: $amount, cycle: $cycle, url  $url}';
  }

  PayPalRecurrentRequestModel copyWith({
    String? currency,
    String? amount,
    String? cycle,
    String? url
  }) {
    return PayPalRecurrentRequestModel(
      url: url ?? this.url,
      currency: currency ?? this.currency,
      amount: amount ?? this.amount,
      cycle: cycle ?? this.cycle,
    );
  }
}