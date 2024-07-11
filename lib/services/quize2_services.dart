import 'package:breedex/model/quize2_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Quize2Services {
  static final _quize2Collection =
      FirebaseFirestore.instance.collection('Quize2');

  Future<void> addQuize2Data(Quize2Model quize) async {
    try {
      await _quize2Collection.add(quize.toMap());
    } catch (e) {
      // ignore: avoid_print
      print('Error adding herd: $e');
    }
  }
}
