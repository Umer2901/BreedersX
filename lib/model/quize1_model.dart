import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first


class Quize1Model {
  String optionSelected;
  List<String> details;
  String score;
  Quize1Model({
    required this.optionSelected,
    required this.details,
    required this.score,
  });

  Quize1Model copyWith({
    String? optionSelected,
    List<String>? details,
    String? score,
  }) {
    return Quize1Model(
      optionSelected: optionSelected ?? this.optionSelected,
      details: details ?? this.details,
      score: score ?? this.score,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'optionSelected': optionSelected,
      'details': details,
      'score': score,
    };
  }

  factory Quize1Model.fromMap(Map<String, dynamic> map) {
    return Quize1Model(
      optionSelected: map['optionSelected'] as String,
      details: List<String>.from((map['details'] as List<String>)),
      score: map['score'] as String,
    );
  }

  factory Quize1Model.fromDoc(DocumentSnapshot snapshot) {
    return Quize1Model(
      optionSelected: snapshot['optionSelected'] as String,
      details: List<String>.from((snapshot['details'] as List<String>)),
      score: snapshot['score'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Quize1Model.fromJson(String source) => Quize1Model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Quize1Model(optionSelected: $optionSelected, details: $details, score: $score)';

  @override
  bool operator ==(covariant Quize1Model other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return 
      other.optionSelected == optionSelected &&
      listEquals(other.details, details) &&
      other.score == score;
  }

  @override
  int get hashCode => optionSelected.hashCode ^ details.hashCode ^ score.hashCode;
   }
