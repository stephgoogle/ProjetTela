import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/services/transaction_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class VersementViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  AuthService authService = locator<AuthService>();
  TransactionService transactionService = locator<TransactionService>();

  double montant = 0;
  double balance = 0;
  bool insuffisant = false;

  VersementViewModel() {
    if ((authService.bankProfile?.balance ?? 0) - 5000 > 0) {
      balance = (authService.bankProfile?.balance ?? 0) - 5000;
    } else {
      insuffisant = true;
    }
  }

  void navigateToProfile() async {
    await _navigationService.navigateTo(Routes.acceuil);
  }

  void navigateToBank() async {
    await _navigationService.navigateToBank(
        hasEpargne: authService.bankProfile?.hasEpargne ?? false);
  }
}
