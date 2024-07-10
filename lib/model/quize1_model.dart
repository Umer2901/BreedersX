import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first



class Quize1Model {
  List<String> details;
  String id;
  String score;
  Quize1Model({
    required this.details,
    required this.id,
    required this.score,
  });

  Quize1Model copyWith({
    List<String>? details,
    String? id,
    String? score,
  }) {
    return Quize1Model(
      details: details ?? this.details,
      id: id ?? this.id,
      score: score ?? this.score,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'details': details,
      'id': id,
      'score': score,
    };
  }

  factory Quize1Model.fromMap(Map<String, dynamic> map) {
    return Quize1Model(
      details: List<String>.from((map['details'] as List<String>)),
      id: map['id'] as String,
      score: map['score'] as String,
    );
  }

  factory Quize1Model.fromDoc(DocumentSnapshot snapshot) {
    return Quize1Model(
      details: List<String>.from((snapshot['details'] as List<String>)),
      id: snapshot['id'] as String,
      score: snapshot['score'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Quize1Model.fromJson(String source) => Quize1Model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Quize1Model(details: $details, id: $id, score: $score)';

  @override
  bool operator ==(covariant Quize1Model other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.details, details) &&
      other.id == id &&
      other.score == score;
  }

  @override
  int get hashCode => details.hashCode ^ id.hashCode ^ score.hashCode;
       }
