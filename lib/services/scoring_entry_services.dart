// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:breedex/model/scoring_entery_model.dart';

// class CowScoringEntryServices {
//   static final _scoringCollection = FirebaseFirestore.instance.collection('Cow Scoring');

//   Future<String> addEntry(ScoringEntry score) async {
//     try {
//       var value = await _scoringCollection.add(score.toMap());
//       await _scoringCollection.doc(value.id).update({'id': value.id});
//       return value.id;
//     } catch (e) {
//       throw Exception('Error adding entry: $e');
//     }
//   }

//   Future<List<ScoringEntry>> getEntriesByHerdId(String herdId) async {
//     try {
//       var querySnapshot = await _scoringCollection.where('herdId', isEqualTo: herdId).get();
//       return querySnapshot.docs.map((doc) => ScoringEntry.fromDoc(doc)).toList();
//     } catch (e) {
//       throw Exception('Error fetching entries: $e');
//     }
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:breedex/model/scoring_entery_model.dart';

class CowScoringEntryServices {
  static final _scoringCollection = FirebaseFirestore.instance.collection('Cow Scoring');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> addEntry(ScoringEntry score) async {
    try {
      final String userId = _auth.currentUser?.uid ?? 'unknown_user';
      Map<String, dynamic> entryData = score.toMap()
        ..addAll({
          'userId': userId,
          'timestamp': FieldValue.serverTimestamp(),
        });

      var value = await _scoringCollection.add(entryData);
      await _scoringCollection.doc(value.id).update({'id': value.id});
      return value.id;
    } catch (e) {
      throw Exception('Error adding entry: $e');
    }
  }

  Future<List<ScoringEntry>> getEntriesByHerdId(String herdId) async {
    try {
      var querySnapshot = await _scoringCollection.where('herdId', isEqualTo: herdId).get();
      return querySnapshot.docs.map((doc) => ScoringEntry.fromDoc(doc)).toList();
    } catch (e) {
      throw Exception('Error fetching entries: $e');
    }
  }
}
