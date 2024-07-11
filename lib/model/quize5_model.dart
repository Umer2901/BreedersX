import 'dart:convert';
import 'package:collection/collection.dart';
// ignore_for_file: depend_on_referenced_packages

// ignore_for_file: public_member_api_docs, sort_constructors_first





class Quize5Model {
  List<String> details;
  List<int> percentages;
  String id;
  String score;
  Quize5Model({
    required this.details,
    required this.percentages,
    required this.id,
    required this.score,
  });

  Quize5Model copyWith({
    List<String>? details,
    List<int>? percentages,
    String? id,
    String? score,
  }) {
    return Quize5Model(
      details: details ?? this.details,
      percentages: percentages ?? this.percentages,
      id: id ?? this.id,
      score: score ?? this.score,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'details': details,
      'percentages': percentages,
      'id': id,
      'score': score,
    };
  }

  factory Quize5Model.fromMap(Map<String, dynamic> map) {
    return Quize5Model(
      details: List<String>.from((map['details'] as List<String>)),
      percentages: List<int>.from((map['percentages'] as List<int>)),
      id: map['id'] as String,
      score: map['score'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Quize5Model.fromJson(String source) => Quize5Model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Quize5Model(details: $details, percentages: $percentages, id: $id, score: $score)';
  }

  @override
  bool operator ==(covariant Quize5Model other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return 
      listEquals(other.details, details) &&
      listEquals(other.percentages, percentages) &&
      other.id == id &&
      other.score == score;
  }

  @override
  int get hashCode {
    return details.hashCode ^
      percentages.hashCode ^
      id.hashCode ^
      score.hashCode;
  }
}
