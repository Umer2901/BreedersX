import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:breedex/model/scoring_entery_model.dart';

class CowScoringEntryServices {
  static final _scoringCollection =
      FirebaseFirestore.instance.collection('Cow Scoring');

  Future<String> addEntry(ScroringEntry score) async {
    try {
      var value = await _scoringCollection.add(score.toMap());
      await _scoringCollection.doc(value.id).update({'id': value.id});
      return value.id;
    } catch (e) {
      // ignore: avoid_print
      throw Exception('Error adding herd: $e');
    }
  }
}
