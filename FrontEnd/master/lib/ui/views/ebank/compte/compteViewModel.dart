import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/services/transaction_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CompteViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  AuthService authService = locator<AuthService>();
  TransactionService transactionService = locator<TransactionService>();

  CompteViewModel();

  void navigateToBank() async {
    await _navigationService.navigateToBank(
        hasEpargne: authService.bankEpargne != null);
  }

  void retrait() async {
    await _navigationService.navigateToRetrait(fromEpargne: false);
  }

  void depot() async {
    await _navigationService.navigateToDepot();
  }

  void renewAbonnement() async {
    await _navigationService.navigateToBuyAbonnementEbank(fromEpargne: false);
  }

  void epargner() async {
    await _navigationService.navigateToVersement();
  }

  Future createEpargne() async {
    await authService.createEpargne(phone: authService.bankProfile!.phone);
  }
}
