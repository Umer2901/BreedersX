import 'dart:math';
import 'package:flutter/material.dart';
import 'package:breedex/model/quize3_model.dart';
import 'package:breedex/services/quize3_services.dart';




// ignore_for_file: avoid_print

class Quiz3Provider with ChangeNotifier {
  Quize3Model _quizData = Quize3Model(
    details: List<String>.filled(4, ''),
    percentages: [22, 26, 26, 26,],
    id: '',
    score: '0',
    is_complete: false,
  );
  final Quize3Services _quizService = Quize3Services();

  Quize3Model get quizData => _quizData;

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
        double score;
        if (i == 1) {
          final field2Value = double.parse(_quizData.details[i]);
          score = max(50 - (field2Value - 25).abs() * 2, 0);
        } else {
          score = _quizData.percentages[i] *
              (double.parse(_quizData.details[i]) / 100);
        }
        totalScore += score;
      }
    }

    totalScore = min(max(totalScore * ((97 - 63) / 50) + 63, 63), 97);
    _quizData = _quizData.copyWith(score: totalScore.toString());
  }

  Future<void> saveQuiz3Data() async {
    _setLoading(true);

    try {
      await _quizService.addQuize3Data(_quizData);
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
    _quizData = Quize3Model(
      details: List<String>.filled(7, ''), 
      percentages: [13, 13, 10, 7, 17, 15, 25], 
      id: '', 
      score: '0',
      is_complete: false, 
    );
    notifyListeners(); 
  }
}

 