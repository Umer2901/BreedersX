import 'package:flutter/material.dart';
import 'package:breedex/model/scoring_entery_model.dart';
import 'package:breedex/services/scoring_entry_services.dart';

class CowScoringEntryProvider with ChangeNotifier {
  final CowScoringEntryServices _scoringEntryServices = CowScoringEntryServices();
  bool _isLoading = false;
  String? _id;

  bool get isLoading => _isLoading;
  String? get id => _id;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> addEntry(ScoringEntry score, String herdId) async {
    setLoading(true);
    try {
      var entryWithHerdId = score.copyWith(herdId: herdId);
      _id = await _scoringEntryServices.addEntry(entryWithHerdId);
      notifyListeners();
    } catch (e) {
      print('Error adding entry: $e');
    } finally {
      setLoading(false);
    }
  }
}
