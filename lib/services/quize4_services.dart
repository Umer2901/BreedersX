import 'package:breedex/model/quize4_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Quize4Services {
  static final _quize4Collection = FirebaseFirestore.instance.collection('Quize4');
  static final _cowScoringCollection = FirebaseFirestore.instance.collection('Cow Scoring');

  Future<void> addQuize4Data(Quize4Model quize) async {
    try {
      await _quize4Collection.add(quize.toMap());
      await _updateCowScoringWithQuizScoreAndDetails(quize.id, quize.score, quize.details);
    } catch (e) {
      // ignore: avoid_print
      print('Error adding quiz: $e');
    }
  }

  Future<void> _updateCowScoringWithQuizScoreAndDetails(
      String cowId, String score, List<String> details) async {
    try {
      Map<String, dynamic> detailsMap = {};
      for (int i = 0; i < details.length; i++) {
        detailsMap['detail${i + 1}'] = details[i];
      }

      await _cowScoringCollection.doc(cowId).update({
        'quiz4Score': score,
        'quiz4Details': detailsMap, 
      });
    } catch (e) {
      // ignore: avoid_print
      print('Error updating cow scoring: $e');
    }
  }
}
