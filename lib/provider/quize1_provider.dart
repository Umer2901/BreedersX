import 'package:flutter/material.dart';
import 'package:breedex/model/quize1_model.dart';
import 'package:breedex/services/quize1_services.dart';


class Quiz1Provider with ChangeNotifier {
 final  Quize1Model _quizData = Quize1Model(
      optionSelected: '', details: List<String>.filled(7, ''), score: '0');
 final Quize1Services _quizService = Quize1Services();

  Quize1Model get quizData => _quizData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setOptionSelected(String option) {
    _quizData.optionSelected = option;
    notifyListeners();
  }

  void addDetail(int index, String detail) {
    if (index >= 0 && index < _quizData.details.length) {
      _quizData.details[index] = detail;
      notifyListeners();
    }
  }

  void setScore(String score) {
    _quizData.score = score;
    notifyListeners();
  }

  Future<void> saveQuizData() async {
    _isLoading = true;
    notifyListeners();

    await _quizService.addQuize1Data(_quizData);

    _isLoading = false;
    notifyListeners();
  }
}
