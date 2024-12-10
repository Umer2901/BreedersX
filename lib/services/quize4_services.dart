import 'package:breedex/model/quize4_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Quize4Services {
  static final _quize4Collection =FirebaseFirestore.instance.collection('Quize4');
  static final _cowScoringCollection = FirebaseFirestore.instance.collection('Cow Scoring');

   Future<void> addQuize4Data(Quize4Model quize) async {
    try {
      await _quize4Collection.add(quize.toMap());
      await _updateCowScoringWithQuizScore(quize.id, quize.score);
    } catch (e) {
      // ignore: avoid_print
      print('Error adding quiz: $e');
    }
  }
   Future<void> _updateCowScoringWithQuizScore(String cowId, String score) async {
    try {
      await _cowScoringCollection.doc(cowId).update({'quiz4Score': score});
    } catch (e) {
      // ignore: avoid_print
      print('Error updating cow scoring: $e');
    }
  }
}
