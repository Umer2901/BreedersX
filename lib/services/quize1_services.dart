import 'package:breedex/model/quize1_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Quize1Services {
  static final _quize1Collection =
      FirebaseFirestore.instance.collection('Quize1');

  Future<void> addQuize1Data(Quize1Model quize) async {
    try {
      await _quize1Collection.add(quize.toMap());
    } catch (e) {
      // ignore: avoid_print
      print('Error adding herd: $e');
    }
  }
}
