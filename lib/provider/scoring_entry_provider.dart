import 'package:flutter/material.dart';
import 'package:breedex/model/scoring_entery_model.dart';
import 'package:breedex/services/scoring_entry_services.dart';
// ignore_for_file: avoid_print

class CowScoringEntryProvider with ChangeNotifier {
  final CowScoringEntryServices _scoringEntryServices =
      CowScoringEntryServices();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> addEntry(ScroringEntry score) async {
    setLoading(true);
    try {
      await _scoringEntryServices.addEntry(score);
    } catch (e) {
      print('Error adding herd: $e');
    } finally {
      setLoading(false);
    }
  }
}
