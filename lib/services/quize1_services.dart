import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:breedex/model/quize1_model.dart';

class Quize1Services {
  static final _quize1Collection = FirebaseFirestore.instance.collection('Quize1');
  static final _cowScoringCollection = FirebaseFirestore.instance.collection('Cow Scoring');

  Future<void> addQuize1Data(Quize1Model quize) async {
    try {
      await _quize1Collection.add(quize.toMap());
      await _updateCowScoringWithQuizScore(quize.id, quize.score);
    } catch (e) {
      // ignore: avoid_print
      print('Error adding quiz: $e');
    }
  }

  Future<void> _updateCowScoringWithQuizScore(String cowId, String score) async {
    try {
      await _cowScoringCollection.doc(cowId).update({'quiz1Score': score});
    } catch (e) {
      // ignore: avoid_print
      print('Error updating cow scoring: $e');
    }
  }

  Future<Quize1Model?> getQuizeDataByCowId(String cowId) async {
  try {
    QuerySnapshot querySnapshot = await _quize1Collection.where('id', isEqualTo: cowId).get();
    if (querySnapshot.docs.isNotEmpty) {
      return Quize1Model.fromDoc(querySnapshot.docs.first);
      
    } else {
      print('No data found for cowId: $cowId');
      return null;
    }
  } catch (e) {
    print('Error fetching quiz data for cowId $cowId: $e');
    return null;
  }
}



}
