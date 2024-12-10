import 'package:cloud_firestore/cloud_firestore.dart';

class ScoringEntry {
  final String name;
  final String cowid;
  final String dob;
  final String dam;
  final String sire;
  final String timeOfCalved;
  final String scoringEntry;
  final String finalScore;
  final String id;
  final String herdId;

  ScoringEntry({
    required this.name,
    required this.cowid,
    required this.dob,
    required this.dam,
    required this.sire,
    required this.timeOfCalved,
    required this.scoringEntry,
    required this.finalScore,
    required this.id,
    required this.herdId,
  });

  ScoringEntry copyWith({
    String? name,
    String? cowid,
    String? dob,
    String? dam,
    String? sire,
    String? timeOfCalved,
    String? scoringEntry,
    String? finalScore,
    String? id,
    String? herdId,
  }) {
    return ScoringEntry(
      name: name ?? this.name,
      cowid: cowid ?? this.cowid,
      dob: dob ?? this.dob,
      dam: dam ?? this.dam,
      sire: sire ?? this.sire,
      timeOfCalved: timeOfCalved ?? this.timeOfCalved,
      scoringEntry: scoringEntry ?? this.scoringEntry,
      finalScore: finalScore ?? this.finalScore,
      id: id ?? this.id,
      herdId: herdId ?? this.herdId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'cowid': cowid,
      'dob': dob,
      'dam': dam,
      'sire': sire,
      'timeOfCalved': timeOfCalved,
      'scoringEntry': scoringEntry,
      'finalScore': finalScore,
      'id': id,
      'herdId': herdId,
    };
  }

  factory ScoringEntry.fromMap(Map<String, dynamic> map) {
    return ScoringEntry(
      name: map['name'] as String? ?? '',
      cowid: map['cowid'] as String? ?? '',
      dob: map['dob'] as String? ?? '',
      dam: map['dam'] as String? ?? '',
      sire: map['sire'] as String? ?? '',
      timeOfCalved: map['timeOfCalved'] as String? ?? '',
      scoringEntry: map['scoringEntry'] as String? ?? '',
      finalScore: map['finalScore'] as String? ?? '',
      id: map['id'] as String? ?? '',
      herdId: map['herdId'] as String? ?? '',
    );
  }

  factory ScoringEntry.fromDoc(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return ScoringEntry(
      name: data['name'] as String? ?? '',
      cowid: data['cowid'] as String? ?? '',
      dob: data['dob'] as String? ?? '',
      dam: data['dam'] as String? ?? '',
      sire: data['sire'] as String? ?? '',
      timeOfCalved: data['timeOfCalved'] as String? ?? '',
      scoringEntry: data['scoringEntry'] as String? ?? '',
      finalScore: data['finalScore'] as String? ?? '',
      id: snapshot.id,
      herdId: data['herdId'] as String? ?? '',
    );
  }

  @override
  String toString() {
    return 'ScoringEntry(name: $name, cowid: $cowid, dob: $dob, dam: $dam, sire: $sire, timeOfCalved: $timeOfCalved, scoringEntry: $scoringEntry, finalScore: $finalScore, id: $id, herdId: $herdId)';
  }

  @override
  bool operator ==(covariant ScoringEntry other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.cowid == cowid &&
        other.dob == dob &&
        other.dam == dam &&
        other.sire == sire &&
        other.timeOfCalved == timeOfCalved &&
        other.scoringEntry == scoringEntry &&
        other.finalScore == finalScore &&
        other.id == id &&
        other.herdId == herdId;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        cowid.hashCode ^
        dob.hashCode ^
        dam.hashCode ^
        sire.hashCode ^
        timeOfCalved.hashCode ^
        scoringEntry.hashCode ^
        finalScore.hashCode ^
        id.hashCode ^
        herdId.hashCode;
  }
}
