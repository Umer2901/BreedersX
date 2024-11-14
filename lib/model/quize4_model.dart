import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Quize4Model {
  List<String> details;
  List<int> percentages;
  String id;
  String score;
    bool is_complete;

  Quize4Model({
    required this.details,
    required this.percentages,
    required this.id,
    required this.score,
    required this.is_complete,
  });

  Quize4Model copyWith({
    List<String>? details,
    List<int>? percentages,
    String? id,
    String? score,
    bool? is_complete,
  }) {
    return Quize4Model(
      details: details ?? this.details,
      percentages: percentages ?? this.percentages,
      id: id ?? this.id,
      score: score ?? this.score,
      is_complete: is_complete ?? this.is_complete,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'details': details,
      'percentages': percentages,
      'id': id,
      'score': score,
           'is_complete': is_complete,
    };
  }

  factory Quize4Model.fromMap(Map<String, dynamic> map) {
    return Quize4Model(
      details: List<String>.from((map['details'] as List<dynamic>? ?? []).map((item) => item as String)),
      percentages: List<int>.from((map['percentages'] as List<dynamic>? ?? []).map((item) => item as int)),
      id: map['id'] as String? ?? '',
      score: map['score'] as String? ?? '',
      is_complete: map['is_complete'] as bool? ?? false,
    );
  }

  factory Quize4Model.fromDoc(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>? ?? {};
    return Quize4Model(
      details: List<String>.from((data['details'] as List<dynamic>? ?? []).map((item) => item as String)),
      percentages: List<int>.from((data['percentages'] as List<dynamic>? ?? []).map((item) => item as int)),
      id: data['id'] as String? ?? '',
      score: data['score'] as String? ?? '',
      is_complete: data['is_complete'] as bool? ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Quize4Model.fromJson(String source) => Quize4Model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Quize4Model(details: $details, percentages: $percentages, id: $id, score: $score, is_complete: $is_complete)';

  @override
  bool operator ==(covariant Quize4Model other) {
    if (identical(this, other)) return true;

    return listEquals(other.details, details) && listEquals(other.percentages, percentages) && other.id == id && other.score == score && other.is_complete == is_complete;
  }

  @override
  int get hashCode => details.hashCode ^ percentages.hashCode ^ id.hashCode ^ score.hashCode^ is_complete.hashCode;
}
