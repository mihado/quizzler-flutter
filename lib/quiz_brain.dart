import 'question.dart';

class QuizBrain {
  List<Question> _questionBank = [
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Question(q: 'A slug\'s blood is green.', a: true),
  ];

  bool hasNextQuestion(int questionNumber) {
    if (questionNumber < _questionBank.length - 1) {
      return true;
    }

    return false;
  }

  Question getQuestion(int questionNumber) {
    return _questionBank[questionNumber];
  }

  String getQuestionText(int questionNumber) {
    return getQuestion(questionNumber).questionText;
  }

  bool getCorrectAnswer(int questionNumber, bool answer) {
    return getQuestion(questionNumber).questionAnswer == answer;
  }
}
