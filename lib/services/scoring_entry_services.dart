import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:breedex/model/scoring_entery_model.dart';



class CowScoringEntryServices {
  static final _scoringCollection = FirebaseFirestore.instance.collection('Cow Scoring');

  Future<void> addEntry(ScroringEntry score) async {
    try {
      await _scoringCollection.add(score.toMap()).then((value) async {
        await _scoringCollection.doc(value.id).update({'id': value.id});
      });
    } catch (e) {
      // ignore: avoid_print
      print('Error adding herd: $e');
    }
  }
}
