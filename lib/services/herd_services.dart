import 'package:breedex/model/herd_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HerdServices {
  static final _herdCollection = FirebaseFirestore.instance.collection('herds');

  Future<void> addHerd(HerdModel herd) async {
    try {
      await _herdCollection.add(herd.toMap()).then((value) async {
        await _herdCollection.doc(value.id).update({'id': value.id});
      });
    } catch (e) {
      print('Error adding herd: $e');
    }
  }
}
