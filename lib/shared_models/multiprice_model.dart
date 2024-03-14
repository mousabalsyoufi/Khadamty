import 'dart:convert';

class MultiPrice {
  String firstPrice;
  String secondPrice;
  MultiPrice({
    required this.firstPrice,
    required this.secondPrice,
  });

  MultiPrice copyWith({
    String? firstPrice,
    String? secondPrice,
  }) {
    return MultiPrice(
      firstPrice: firstPrice ?? this.firstPrice,
      secondPrice: secondPrice ?? this.secondPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstPrice': firstPrice,
      'secondPrice': secondPrice,
    };
  }

  factory MultiPrice.fromMap(Map<String, dynamic> map) {
    return MultiPrice(
      firstPrice: map['1'] ?? '0.0000000',
      secondPrice: map['2'] ?? '0.0000000',
    );
  }

  String toJson() => json.encode(toMap());

  factory MultiPrice.fromJson(String source) =>
      MultiPrice.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'MultiPrice(firstPrice: $firstPrice, secondPrice: $secondPrice)';

  @override
  bool operator ==(covariant MultiPrice other) {
    if (identical(this, other)) return true;

    return other.firstPrice == firstPrice && other.secondPrice == secondPrice;
  }

  @override
  int get hashCode => firstPrice.hashCode ^ secondPrice.hashCode;
}