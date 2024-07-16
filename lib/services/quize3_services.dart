import 'package:breedex/model/quize3_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Quize3Services {
  static final _quize3Collection = FirebaseFirestore.instance.collection('Quize3');
      static final _cowScoringCollection = FirebaseFirestore.instance.collection('Cow Scoring');

   Future<void> addQuize3Data(Quize3Model quize) async {
    try {
      await _quize3Collection.add(quize.toMap());
      await _updateCowScoringWithQuizScore(quize.id, quize.score);
    } catch (e) {
      // ignore: avoid_print
      print('Error adding quiz: $e');
    }
  }
   Future<void> _updateCowScoringWithQuizScore(String cowId, String score) async {
    try {
      await _cowScoringCollection.doc(cowId).update({'quiz3Score': score});
    } catch (e) {
      // ignore: avoid_print
      print('Error updating cow scoring: $e');
    }
  }
}
