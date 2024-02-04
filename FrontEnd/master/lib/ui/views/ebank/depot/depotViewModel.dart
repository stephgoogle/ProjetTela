import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/models/transactions.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/services/transaction_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DepotViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  AuthService authService = locator<AuthService>();
  final TransactionService _transactionService = locator<TransactionService>();

  double montant = 0;

  DepotViewModel();

  void navigateToProfile() async {
    await _navigationService.navigateToBank(
        hasEpargne: authService.bankProfile?.hasEpargne ?? false);
  }

  Future depot(TelaTransaction transaction) async {
    await authService.postDepot(
        transaction: transaction, profile: authService.bankProfile!);
  }

  void navigateToBank() async {
    await _navigationService.navigateToBank(
        hasEpargne: authService.bankProfile?.hasEpargne ?? false);
  }

  Future<String> getTransactioNumber() async {
    return await _transactionService.getTransactionNumber('Depot');
  }
}
