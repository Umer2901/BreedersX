import 'package:breedex/model/quize5_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class Quize5Services {
  static final _quize5Collection = FirebaseFirestore.instance.collection('Quize5');
      static final _cowScoringCollection = FirebaseFirestore.instance.collection('Cow Scoring');

   Future<void> addQuize5Data(Quize5Model quize) async {
    try {
      await _quize5Collection.add(quize.toMap());
      await _updateCowScoringWithQuizScore(quize.id, quize.score);
    } catch (e) {
      // ignore: avoid_print
      print('Error adding quiz: $e');
    }
  }
   Future<void> _updateCowScoringWithQuizScore(String cowId, String score) async {
    try {
      await _cowScoringCollection.doc(cowId).update({'quiz5Score': score});
    } catch (e) {
      // ignore: avoid_print
      print('Error updating cow scoring: $e');
    }
  }
}
