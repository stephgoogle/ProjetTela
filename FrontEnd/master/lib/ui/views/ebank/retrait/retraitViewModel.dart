import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/services/transaction_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RetraitViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  AuthService authService = locator<AuthService>();
  final TransactionService _transactionService = locator<TransactionService>();

  double montant = 0;
  double frais = 0;

  double balance = 0;
  final bool fromEpargne;
  bool insuffisant = false;

  RetraitViewModel(this.fromEpargne) {
    if (fromEpargne) {
      if ((authService.bankEpargne?.balance ?? 0) > 0) {
        balance = authService.bankEpargne?.balance ?? 0;
      } else {
        insuffisant = true;
      }
    } else {
      if ((authService.bankProfile?.balance ?? 0) >= 5000) {
        balance = authService.bankProfile?.balance ?? 0 - 5000;
      } else {
        insuffisant = true;
      }
    }
  }

  void navigateToProfile() async {
    await _navigationService.navigateTo(Routes.acceuil);
  }

  void navigateToBank() async {
    await _navigationService.navigateToBank(
        hasEpargne: authService.bankProfile?.hasEpargne ?? false);
  }

  Future retrait() async {
    await _transactionService.postRetrait(
        amount: montant,
        profile: authService.bankProfile!,
        frais: frais,
        fromEpargne: fromEpargne);
    navigateToBank();
  }
}
