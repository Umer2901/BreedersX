import 'dart:math';
import 'package:flutter/material.dart';
import 'package:breedex/model/quize1_model.dart';
import 'package:breedex/services/quize1_services.dart';
// ignore_for_file: avoid_print

class Quiz1Provider with ChangeNotifier {
  Quize1Model _quizData = Quize1Model(
    details: List<String>.filled(7, ''),
    percentages: [13, 13, 10, 7, 17, 15, 25],
    id: '',
    score: '0',
    is_complete: false,
  );
  final Quize1Services _quizService = Quize1Services();

  Quize1Model get quizData => _quizData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isBuilding = false;
  bool get isBuilding => _isBuilding;

  void setBuilding(bool value) {
    _isBuilding = value;
  }

  void addDetail(int index, String detail) {
    if (index >= 0 && index < _quizData.details.length) {
      _quizData.details[index] = detail;
      _calculateScore();
      if (!_isBuilding) {
        notifyListeners();
      }
    }
  }

  void setId(String id) {
    if (_quizData.id != id) {
      _quizData = _quizData.copyWith(id: id);
      if (!_isBuilding) {
        notifyListeners();
      }
    }
  }

 void _calculateScore() {
  double weightedSum = 0.0;

  for (int i = 0; i < _quizData.details.length; i++) {
    if (_quizData.details[i].isNotEmpty) {
      double detailValue = double.parse(_quizData.details[i]);
      weightedSum += detailValue * (_quizData.percentages[i] / 100);
    }
  }

  double scaledScore = weightedSum * ((97 - 65) / 50) + 65;
  double boundedScore = min(max(scaledScore, 65), 97);
  _quizData = _quizData.copyWith(score: boundedScore.toString());
}

  Future<void> saveQuizData() async {
    _setLoading(true);

    try {
      await _quizService.addQuize1Data(_quizData);
        _quizData = _quizData.copyWith(is_complete: true);
    } catch (e) {
      print('Error saving quiz data: $e');
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    if (_isLoading != value) {
      _isLoading = value;
      if (!_isBuilding) {
        notifyListeners();
      }
    }
  }
  

}
