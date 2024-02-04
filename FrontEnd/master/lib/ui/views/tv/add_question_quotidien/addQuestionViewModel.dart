
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/auth_service.dart';

class AddQuestionViewModel extends BaseViewModel{
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final AuthService _authService = locator<AuthService>();

  int id = 0;
  //
  String question_1 = "";
  String question_2 = "";
  String response_1 = "";
  String response_2 = "";



  Future saveDailyQuestion() async {
    print(
        "####### Question 1 : $question_1, Question 2 : $question_2 #######"
    );
    await _authService.saveDailyQuestions(
        question_1: question_1,
        question_2: question_2,
        response_1: response_1,
        response_2: response_2
    );
  }

  void navigateToAcceuil() async {
    await _navigationService.navigateTo(Routes.acceuil);
  }
}