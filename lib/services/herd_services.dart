
// ignore_for_file: avoid_print, unnecessary_cast

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:breedex/model/herd_model.dart';

class HerdServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> addHerd(HerdModel herd) async {
    try {
      final docRef = await _firestore.collection('herds').add({
        'name': herd.name,
        'location': herd.location,
        'headScore': herd.headScore,
      });
      await docRef.update({'id': docRef.id});
      return docRef.id;
    } catch (e) {
      print('Error adding herd to Firestore: $e');
      return null;
    }
  }

  Future<List<HerdModel>> fetchHerds() async {
    try {
      final querySnapshot = await _firestore.collection('herds').get();
      return querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>; 
        return HerdModel(
          id: doc.id,
          name: data['name'] ?? '',
          location: data['location'] ?? '',
          headScore: data['headScore'] ?? 0,
        );
      }).toList();
    } catch (e) {
      print('Error fetching herds from Firestore: $e');
      return [];
    }
  }
}


