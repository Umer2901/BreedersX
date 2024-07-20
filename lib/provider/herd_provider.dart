import 'package:flutter/material.dart';
import 'package:breedex/model/herd_model.dart';
import 'package:breedex/services/herd_services.dart';

class HerdProvider with ChangeNotifier {
  final HerdServices _herdServices = HerdServices();
  bool _isLoading = false;
  List<HerdModel> _herds = [];

  bool get isLoading => _isLoading;
  List<HerdModel> get herds => _herds;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> addHerd(HerdModel herd) async {
    setLoading(true);
    try {
      await _herdServices.addHerd(herd);
    } catch (e) {
      print('Error adding herd: $e');
    } finally {
      setLoading(false);
    }
  }

  Future<void> fetchHerds() async {
    setLoading(true);
    try {
      _herds = await _herdServices.fetchHerds();
      notifyListeners();
    } catch (e) {
      print('Error fetching herds: $e');
    } finally {
      setLoading(false);
    }
  }
}
