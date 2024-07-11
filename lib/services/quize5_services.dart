import 'package:breedex/model/quize5_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class Quize5Services {
  static final _quize5Collection =
      FirebaseFirestore.instance.collection('Quize5');

  Future<void> addQuize5Data(Quize5Model quize) async {
    try {
      await _quize5Collection.add(quize.toMap());
    } catch (e) {
      // ignore: avoid_print
      print('Error adding herd: $e');
    }
  }
}
