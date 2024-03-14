class PayPalRequestModel {
  final String note;
  final String amountCurrency;
  final String amountValue;
  final String? url;

  PayPalRequestModel({
    required this.note,
    required this.amountCurrency,
    required this.amountValue,
    required this.url});


  Map<String, dynamic> toMap() {
    return {
      'note': note,
      'amountCurrency': amountCurrency,
      'amountValue': amountValue,
      'url':url
    };
  }

  factory PayPalRequestModel.fromMap(Map<String, dynamic> map) {
    return PayPalRequestModel(
      url: map['url'] as String,
      note: map['note'] as String,
      amountCurrency: map['amountCurrency'] as String,
      amountValue: map['amountValue'] as String,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PayPalRequestModel &&
          runtimeType == other.runtimeType &&
          note == other.note &&
          amountCurrency == other.amountCurrency &&
          url == other.url &&
          amountValue == other.amountValue;

  @override
  int get hashCode =>
      note.hashCode ^ amountCurrency.hashCode ^ amountValue.hashCode;

  PayPalRequestModel copyWith({
    String? note,
    String? amountCurrency,
    String? amountValue,
    String? url
  }) {
    return PayPalRequestModel(
      note: note ?? this.note,
      url: url ?? this.url,
      amountCurrency: amountCurrency ?? this.amountCurrency,
      amountValue: amountValue ?? this.amountValue,
    );
  }
}