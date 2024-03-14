class LineOrder {
  final String? id;
  final String? productLabel;
  final String? startDate;
  final double rating;
  LineOrder({this.id, this.productLabel, this.startDate, this.rating = -1.0});

  factory LineOrder.fromJson(Map<String, dynamic> json) {
    ArrayOptions options = json['array_options'] is List
        ? ArrayOptions(
            options_efficacite: -1.0,
            options_ponctualite: -1.0,
            options_presentation: -1.0)
        : ArrayOptions.fromMap(json['array_options']);

    double ratingOtp = double.parse(((options.options_efficacite! +
                options.options_ponctualite! +
                options.options_presentation!) /
            3)
        .toStringAsFixed(1));
    return LineOrder(
        id: json['id'],
        startDate: json['date_start'] ?? '-3600',
        productLabel: json['product_label'],
        rating: ratingOtp);
  }

  @override
  String toString() {
    return 'LineOrder{id: $id, product_label: $productLabel, rating: $rating}';
  }
}

class ArrayOptions {
  final double? options_efficacite;
  final double? options_ponctualite;
  final double? options_presentation;

  ArrayOptions(
      {this.options_efficacite,
      this.options_ponctualite,
      this.options_presentation});

  Map<String, dynamic> toMap() {
    return {
      'options_efficacite': this.options_efficacite,
      'options_ponctualite': this.options_ponctualite,
      'options_presentation': this.options_presentation,
    };
  }

  factory ArrayOptions.fromMap(Map<String, dynamic> map) {
    return ArrayOptions(
      options_efficacite: double.parse(map['options_efficacite'] ?? "-1.0"),
      options_ponctualite: double.parse(map['options_ponctualite'] ?? "-1.0"),
      options_presentation: double.parse(map['options_presentation'] ?? "-1.0"),
    );
  }

  @override
  String toString() {
    return 'ArrayOptions{options_efficacite: $options_efficacite, options_ponctualite: $options_ponctualite, options_presentation: $options_presentation}';
  }
}
