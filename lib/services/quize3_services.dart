import 'package:breedex/model/quize3_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Quize3Services {
  static final _quize3Collection =
      FirebaseFirestore.instance.collection('Quize3');

  Future<void> addQuize3Data(Quize3Model quize) async {
    try {
      await _quize3Collection.add(quize.toMap());
    } catch (e) {
      // ignore: avoid_print
      print('Error adding herd: $e');
    }
  }
}
