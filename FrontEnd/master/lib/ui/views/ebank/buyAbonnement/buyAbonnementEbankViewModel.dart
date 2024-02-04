import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/models/abonnementType.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:mobile/services/transaction_service.dart';

class BuyAbonnementEbankViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  final AuthService _authService = locator<AuthService>();
  final DialogService _dialogService = locator<DialogService>();
  final TransactionService _transactionService = locator<TransactionService>();

  final bool _isA = false;
  final bool fromEpargne;
  List<AbonnementType> abonnements = [];

  Stream<bool> get isAuth => _authService.isConnected;
  User? get user => _authService.user;

  BuyAbonnementEbankViewModel(this.fromEpargne) {
    abonnements = _authService.abonnementType;
  }

  Future buyAbonnement(AbonnementType abonnement) async {
    await _authService.buyAbonnementFromEbank(
        abonnement: abonnement,
        profile: _authService.bankProfile!,
        user: _authService.user!,
        fromEpargne: fromEpargne);
    _navigationService.navigateToBank(
        hasEpargne: _authService.bankProfile?.hasEpargne ?? false);
  }

  void navigateToCGUFinance() async {
    await _navigationService
        .navigateTo(Routes.conditionGeneralDUtilisationSFinance);
  }
}
