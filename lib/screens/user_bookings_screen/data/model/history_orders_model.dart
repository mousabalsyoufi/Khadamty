import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/line_orders_model.dart';
import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/upcoming_orders_model.dart';

class HistoryOrdersModel {
  final String? id;
  final int? status;
  final String? date;
  final String? date_commande;
  final List<LineOrder>? lines;
  final CategoryOrderModel? category;
  HistoryOrdersModel(
      {this.id, this.status, this.date, this.date_commande, this.lines, this.category});


  @override
  String toString() {
    return 'HistoryOrdersModel{id: $id, status: $status, date: $date, date_commande: $date_commande, lines: $lines, category: $category}';
  }

  factory HistoryOrdersModel.fromJson(Map<String, dynamic> json) {
    return HistoryOrdersModel(
        id: json['id'],
        status: json['statut'],
        date: json['date'],
        date_commande: json['date_commande'],
        lines: json['lines'] != null
            ? json['lines']
                .map<LineOrder>((element) => LineOrder.fromJson(element))
                .toList()
            : [],
        category: CategoryOrderModel.fromJson(json['category']));
  }
}
