// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FaqModel {
  String faqName;
  List<FaqItem> items;
  FaqModel({
    required this.faqName,
    required this.items,
  });

  FaqModel copyWith({
    String? faqName,
    List<FaqItem>? items,
  }) {
    return FaqModel(
      faqName: faqName ?? this.faqName,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'faqName': faqName,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory FaqModel.fromMap(Map<String, dynamic> map) {
    return FaqModel(
      faqName: map['faqName'] as String,
      items: List<FaqItem>.from(
        (map['items'] as List<int>).map<FaqItem>(
          (x) => FaqItem.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory FaqModel.fromJson(String source) =>
      FaqModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FaqModel(faqName: $faqName, items: $items)';

  @override
  bool operator ==(covariant FaqModel other) {
    if (identical(this, other)) return true;

    return other.faqName == faqName && listEquals(other.items, items);
  }

  @override
  int get hashCode => faqName.hashCode ^ items.hashCode;
}

class FaqItem {
  String question;
  String answer;
  FaqItem({
    required this.question,
    required this.answer,
  });

  FaqItem copyWith({
    String? question,
    String? answer,
  }) {
    return FaqItem(
      question: question ?? this.question,
      answer: answer ?? this.answer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'answer': answer,
    };
  }

  factory FaqItem.fromMap(Map<String, dynamic> map) {
    return FaqItem(
      question: map['question'] as String,
      answer: map['answer'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FaqItem.fromJson(String source) =>
      FaqItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FaqItem(question: $question, answer: $answer)';

  @override
  bool operator ==(covariant FaqItem other) {
    if (identical(this, other)) return true;

    return other.question == question && other.answer == answer;
  }

  @override
  int get hashCode => question.hashCode ^ answer.hashCode;
}

