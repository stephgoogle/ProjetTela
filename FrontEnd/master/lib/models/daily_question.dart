
class DailyQuestion
{
  int id = 0;
  String question_1 = "";
  String question_2 = "";
  String reponse_1 = "";
  String reponse_2 = "";

  DailyQuestion(
    {
      required this.id,
      required this.question_1,
      required this.question_2,
      required this.reponse_1,
      required this.reponse_2

  }
      );

  static DailyQuestion fromJson(List<dynamic> json)
  {
    DailyQuestion dailyQuestion = DailyQuestion(
    id: json[0]["id"],
    question_1: json[0]["question_1"],
    question_2: json[0]["question_2"],
    reponse_1: json[0]["reponse_1"],
    reponse_2: json[0]["reponse_2"]
    );

    return dailyQuestion;
  }
}