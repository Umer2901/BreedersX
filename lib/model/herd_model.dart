import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class HerdModel {
  final String name;
  final String location;
  final String headScore;
  final String id;
  HerdModel({
    required this.name,
    required this.location,
    required this.headScore,
    required this.id,
  });

  HerdModel copyWith({
    String? name,
    String? location,
    String? headScore,
    String? id,
  }) {
    return HerdModel(
      name: name ?? this.name,
      location: location ?? this.location,
      headScore: headScore ?? this.headScore,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'location': location,
      'headScore': headScore,
      'id': id,
    };
  }
  

  factory HerdModel.fromMap(Map<String, dynamic> map) {
    return HerdModel(
      name: map['name'] as String,
      location: map['location'] as String,
      headScore: map['headScore'] as String,
      id: map['id'] as String,
    );
  }

  factory HerdModel.fromDoc(DocumentSnapshot snapshot) {
    return HerdModel(
      name: snapshot['name'] as String,
      location: snapshot['location'] as String,
      headScore: snapshot['headScore'] as String,
      id: snapshot['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HerdModel.fromJson(String source) => HerdModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HerdModel(name: $name, location: $location, headScore: $headScore, id: $id)';
  }

  @override
  bool operator ==(covariant HerdModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.location == location &&
      other.headScore == headScore &&
      other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      location.hashCode ^
      headScore.hashCode ^
      id.hashCode;
  }
}
