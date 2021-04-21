class Question {
  String answer;
  String ask;
  String wrongAnswer1;
  String wrongAnswer2;
  String wrongAnswer3;

  Question(
      {this.answer,
        this.ask,
        this.wrongAnswer1,
        this.wrongAnswer2,
        this.wrongAnswer3});

  Question.fromJson(Map<String, dynamic> json) {
    answer = json['Answer'];
    ask = json['Ask'];
    wrongAnswer1 = json['Wrong_answer_1'];
    wrongAnswer2 = json['Wrong_answer_2'];
    wrongAnswer3 = json['Wrong_answer_3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Answer'] = this.answer;
    data['Ask'] = this.ask;
    data['Wrong_answer_1'] = this.wrongAnswer1;
    data['Wrong_answer_2'] = this.wrongAnswer2;
    data['Wrong_answer_3'] = this.wrongAnswer3;
    return data;
  }
}
