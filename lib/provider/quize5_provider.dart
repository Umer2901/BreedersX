import 'package:flutter/material.dart';
import 'package:breedex/model/quize5_model.dart';
import 'package:breedex/services/quize5_services.dart';



// ignore_for_file: avoid_print

class Quiz5Provider with ChangeNotifier {
  
  Quize5Model _quizData = Quize5Model(
    details: List<String>.filled(7, ''),
    percentages: [20, 15, 15, 15, 15, 10, 10],
    id: '',
    score: '0',
  );
 final Quize5Services _quizService = Quize5Services();

  Quize5Model get quizData => _quizData;

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
    int totalScore = 0;
    for (int i = 0; i < _quizData.details.length; i++) {
      if (_quizData.details[i].isNotEmpty) {
        totalScore += _quizData.percentages[i];
      }
    }
    _quizData = _quizData.copyWith(score: totalScore.toString());
  }

  Future<void> saveQuiz5Data() async {
    _setLoading(true);

    try {
      await _quizService.addQuize5Data(_quizData);
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
