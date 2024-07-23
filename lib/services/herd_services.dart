// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:breedex/model/herd_model.dart';

// class HerdServices {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> addHerd(HerdModel herd) async {
//     DocumentReference docRef = await _firestore.collection('herds').add({
//       'name': herd.name,
//       'location': herd.location,
//       'headScore': herd.headScore,
//       'id': herd.id
//     });
//   }

//   Future<List<HerdModel>> fetchHerds() async {
//     QuerySnapshot snapshot = await _firestore.collection('herds').get();
//     return snapshot.docs.map((doc) {
//       return HerdModel(
//         id: doc.id,
//         name: doc['name'],
//         location: doc['location'],
//         headScore: doc['headScore'],
//         id: 
//       );
//     }).toList();
//   }
// }
// import 'package:breedex/model/herd_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class HerdServices {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;

//   Future<String?> addHerd(HerdModel herd) async {
//     try {
//       final docRef = await _db.collection('herds').add(herd.toMap());
//       return docRef.id;
//     } catch (e) {
//       print('Error adding herd to Firestore: $e');
//       return null;
//     }
//   }

//   Future<List<HerdModel>> fetchHerds() async {
//     try {
//       final querySnapshot = await _db.collection('herds').get();
//       return querySnapshot.docs.map((doc) => HerdModel.fromMap(doc.data())).toList();
//     } catch (e) {
//       print('Error fetching herds from Firestore: $e');
//       return [];
//     }
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:breedex/model/herd_model.dart';

class HerdServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> addHerd(HerdModel herd) async {
    try {
      // Add herd to Firestore
      final docRef = await _firestore.collection('herds').add({
        'name': herd.name,
        'location': herd.location,
        'headScore': herd.headScore,
      });

      // Update the document with the ID
      await docRef.update({'id': docRef.id});

      // Return the document ID
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
        final data = doc.data() as Map<String, dynamic>; // Cast data to Map<String, dynamic>
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


