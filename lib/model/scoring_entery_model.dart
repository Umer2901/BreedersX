import 'dart:convert';
// ignore_for_file: public_member_api_docs, sort_constructors_first



class ScroringEntry {
  final String name;
  final String dob;
  final String dam;
  final String sire;
  final String timeOfcalved;
  ScroringEntry({
    required this.name,
    required this.dob,
    required this.dam,
    required this.sire,
    required this.timeOfcalved,
  });

  ScroringEntry copyWith({
    String? name,
    String? dob,
    String? dam,
    String? sire,
    String? timeOfcalved,
  }) {
    return ScroringEntry(
      name: name ?? this.name,
      dob: dob ?? this.dob,
      dam: dam ?? this.dam,
      sire: sire ?? this.sire,
      timeOfcalved: timeOfcalved ?? this.timeOfcalved,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'dob': dob,
      'dam': dam,
      'sire': sire,
      'timeOfcalved': timeOfcalved,
    };
  }

  factory ScroringEntry.fromMap(Map<String, dynamic> map) {
    return ScroringEntry(
      name: map['name'] as String,
      dob: map['dob'] as String,
      dam: map['dam'] as String,
      sire: map['sire'] as String,
      timeOfcalved: map['timeOfcalved'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScroringEntry.fromJson(String source) => ScroringEntry.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ScroringEntry(name: $name, dob: $dob, dam: $dam, sire: $sire, timeOfcalved: $timeOfcalved)';
  }

  @override
  bool operator ==(covariant ScroringEntry other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.dob == dob &&
      other.dam == dam &&
      other.sire == sire &&
      other.timeOfcalved == timeOfcalved;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      dob.hashCode ^
      dam.hashCode ^
      sire.hashCode ^
      timeOfcalved.hashCode;
  }
}
