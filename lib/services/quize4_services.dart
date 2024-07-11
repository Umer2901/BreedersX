import 'package:breedex/model/quize4_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Quize4Services {
  static final _quize4Collection =
      FirebaseFirestore.instance.collection('Quize4');

  Future<void> addQuize4Data(Quize4Model quize) async {
    try {
      await _quize4Collection.add(quize.toMap());
    } catch (e) {
      // ignore: avoid_print
      print('Error adding herd: $e');
    }
  }
}
