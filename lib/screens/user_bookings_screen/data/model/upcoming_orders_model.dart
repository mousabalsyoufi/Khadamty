import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/line_orders_model.dart';

class UpcomingOrdersModel{

  final int? status;
  final String? date;
  final String? id;
  final String? date_commande;
  final bool? isRecurrent;
  final List<LineOrder>? lines;
  final CategoryOrderModel? category;

  UpcomingOrdersModel({this.status, this.date, this.date_commande, this.lines,this.id,this.category,this.isRecurrent});

  factory UpcomingOrdersModel.fromJson(Map<String,dynamic> json){
    return UpcomingOrdersModel(
      id:json['id'],
      status:json['statut'],
      isRecurrent: json['isRecurrent'],
      date: json['date'],
      date_commande: json['date_commande'],
      lines: json['lines'] != null ? json['lines'].map<LineOrder>((json) => LineOrder.fromJson(json)).toList():[],
      category: CategoryOrderModel.fromJson(json['category'])
    );
  }
}

class CategoryOrderModel{
  final String id;
  final String label;

  final String color;

  CategoryOrderModel({required this.id,required this.label,required this.color});


  factory CategoryOrderModel.fromJson(Map<String,dynamic> json){
    return CategoryOrderModel(id: json['id'], label: json['label'], color: json['color']);
  }

  @override
  String toString() {
    return 'Category{id: $id, label: $label, color: $color}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryOrderModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          label == other.label &&
          color == other.color;

  @override
  int get hashCode => id.hashCode ^ label.hashCode ^ color.hashCode;
}


