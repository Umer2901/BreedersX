import 'dart:math';
import 'package:flutter/material.dart';
import 'package:breedex/model/quize2_model.dart';
import 'package:breedex/services/quize2_services.dart';


// ignore_for_file: avoid_print

class Quiz2Provider with ChangeNotifier {
  Quize2Model _quizData = Quize2Model(
    details: List<String>.filled(10, ''),
    percentages: [10, 15, 10, 10, 20, 10, 10, 5, 5, 5],
    id: '',
    score: '0',
    is_complete: false,
  );
  final Quize2Services _quizService = Quize2Services();

  Quize2Model get quizData => _quizData;

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
    double totalScore = 0.0;
    for (int i = 0; i < _quizData.details.length; i++) {
      if (_quizData.details[i].isNotEmpty) {
        totalScore += _quizData.percentages[i] *
            (double.parse(_quizData.details[i]) / 100);
      }
    }
    totalScore = min(max(totalScore * ((97 - 63) / 50) + 63, 63), 97);
    _quizData = _quizData.copyWith(score: totalScore.toString());
  }

  Future<void> saveQuiz2Data() async {
    _setLoading(true);

    try {
      await _quizService.addQuize2Data(_quizData);
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
    void clearData() {
    _quizData = Quize2Model(
      details: List<String>.filled(7, ''), 
      percentages: [13, 13, 10, 7, 17, 15, 25], 
      id: '', 
      score: '0',
      is_complete: false, 
    );
    notifyListeners(); 
  }
}

 