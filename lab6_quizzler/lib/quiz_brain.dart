class Question {
  String questionText;
  bool questionAnswer;

  Question(this.questionText, this.questionAnswer);
}

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question('You can swallow while upside down.', true),
    Question('The Great Wall of China is visible from space.', false),
    Question('Some turtles can breathe through their butts.', true),
    Question('Humans share 50% of their DNA with bananas.', true),
    Question('A group of flamingos is called a flamboyance.', true),
    Question('Sound travels faster than light.', false),
    Question('Bats are blind.', false),
    Question('Goldfish have a 3-second memory.', false),
    Question('Honey never spoils.', true),
    Question('The Eiffel Tower grows taller in summer.', true),
  ];

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    return _questionNumber >= _questionBank.length - 1;
  }

  void nextQuestion() {
    if (!isFinished()) {
      _questionNumber++;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
