import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';


// ignore_for_file: public_member_api_docs, sort_constructors_first


class ScroringEntry {
  final String name;
  final String dob;
  final String dam;
  final String sire;
  final String timeOfcalved;
  final String scoringEntery;
  final String id;
  ScroringEntry({
    required this.name,
    required this.dob,
    required this.dam,
    required this.sire,
    required this.timeOfcalved,
    required this.scoringEntery,
    required this.id,
  });
  

  ScroringEntry copyWith({
    String? name,
    String? dob,
    String? dam,
    String? sire,
    String? timeOfcalved,
    String? scoringEntery,
    String? id,
  }) {
    return ScroringEntry(
      name: name ?? this.name,
      dob: dob ?? this.dob,
      dam: dam ?? this.dam,
      sire: sire ?? this.sire,
      timeOfcalved: timeOfcalved ?? this.timeOfcalved,
      scoringEntery: scoringEntery ?? this.scoringEntery,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'dob': dob,
      'dam': dam,
      'sire': sire,
      'timeOfcalved': timeOfcalved,
      'scoringEntery': scoringEntery,
      'id': id,
    };
  }

  factory ScroringEntry.fromMap(Map<String, dynamic> map) {
    return ScroringEntry(
      name: map['name'] as String,
      dob: map['dob'] as String,
      dam: map['dam'] as String,
      sire: map['sire'] as String,
      timeOfcalved: map['timeOfcalved'] as String,
      scoringEntery: map['scoringEntery'] as String,
      id: map['id'] as String,
    );
  }
  factory ScroringEntry.fromDoc(DocumentSnapshot snapshot) {
    return ScroringEntry(
      name: snapshot['name'] as String,
      dob: snapshot['dob'] as String,
      dam: snapshot['dam'] as String,
      sire: snapshot['sire'] as String,
      timeOfcalved: snapshot['timeOfcalved'] as String,
      scoringEntery: snapshot['scoringEntery'] as String,
      id: snapshot['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScroringEntry.fromJson(String source) => ScroringEntry.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ScroringEntry(name: $name, dob: $dob, dam: $dam, sire: $sire, timeOfcalved: $timeOfcalved, scoringEntery: $scoringEntery, id: $id)';
  }

  @override
  bool operator ==(covariant ScroringEntry other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.dob == dob &&
      other.dam == dam &&
      other.sire == sire &&
      other.timeOfcalved == timeOfcalved &&
      other.scoringEntery == scoringEntery &&
      other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      dob.hashCode ^
      dam.hashCode ^
      sire.hashCode ^
      timeOfcalved.hashCode ^
      scoringEntery.hashCode ^
      id.hashCode;
  }
  }
