import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ScoringEntry {
  final String name;
  final String dob;
  final String dam;
  final String sire;
  final String timeOfCalved;
  final String scoringEntry;
  final String id;
  final String herdId;  

  ScoringEntry({
    required this.name,
    required this.dob,
    required this.dam,
    required this.sire,
    required this.timeOfCalved,
    required this.scoringEntry,
    required this.id,
    required this.herdId, 
  });

  ScoringEntry copyWith({
    String? name,
    String? dob,
    String? dam,
    String? sire,
    String? timeOfCalved,
    String? scoringEntry,
    String? id,
    String? herdId, 
  }) {
    return ScoringEntry(
      name: name ?? this.name,
      dob: dob ?? this.dob,
      dam: dam ?? this.dam,
      sire: sire ?? this.sire,
      timeOfCalved: timeOfCalved ?? this.timeOfCalved,
      scoringEntry: scoringEntry ?? this.scoringEntry,
      id: id ?? this.id,
      herdId: herdId ?? this.herdId, 
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'dob': dob,
      'dam': dam,
      'sire': sire,
      'timeOfCalved': timeOfCalved,
      'scoringEntry': scoringEntry,
      'id': id,
      'herdId': herdId,
    };
  }

  factory ScoringEntry.fromMap(Map<String, dynamic> map) {
    return ScoringEntry(
      name: map['name'] as String,
      dob: map['dob'] as String,
      dam: map['dam'] as String,
      sire: map['sire'] as String,
      timeOfCalved: map['timeOfCalved'] as String,
      scoringEntry: map['scoringEntry'] as String,
      id: map['id'] as String,
      herdId: map['herdId'] as String,
    );
  }

  factory ScoringEntry.fromDoc(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return ScoringEntry(
      name: data['name'] as String,
      dob: data['dob'] as String,
      dam: data['dam'] as String,
      sire: data['sire'] as String,
      timeOfCalved: data['timeOfCalved'] as String,
      scoringEntry: data['scoringEntry'] as String,
      id: snapshot.id, 
      herdId: data['herdId'] as String,  
    );
  }

  String toJson() => json.encode(toMap());

  factory ScoringEntry.fromJson(String source) =>
      ScoringEntry.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ScoringEntry(name: $name, dob: $dob, dam: $dam, sire: $sire, timeOfCalved: $timeOfCalved, scoringEntry: $scoringEntry, id: $id, herdId: $herdId)';
  }

  @override
  bool operator ==(covariant ScoringEntry other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.dob == dob &&
        other.dam == dam &&
        other.sire == sire &&
        other.timeOfCalved == timeOfCalved &&
        other.scoringEntry == scoringEntry &&
        other.id == id &&
        other.herdId == herdId; 
  }

  @override
  int get hashCode {
    return name.hashCode ^
        dob.hashCode ^
        dam.hashCode ^
        sire.hashCode ^
        timeOfCalved.hashCode ^
        scoringEntry.hashCode ^
        id.hashCode ^
        herdId.hashCode;
  }
}
