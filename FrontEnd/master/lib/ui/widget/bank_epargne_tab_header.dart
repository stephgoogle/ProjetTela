import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/services/auth_service.dart';

class BankEpargneTabHeader extends StatelessWidget {
  BankEpargneTabHeader({Key? key}) : super(key: key);
  final AuthService _authService = locator<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 80,
      child: Column(
        children: [
          Text(
            'Epargne',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              '(Compte épargne)',
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                  color: Colors.deepOrange),
            ),
          ),
          Text(
            NumberFormat.currency(
                    locale: 'fr_FR', name: 'F CFA', decimalDigits: 0)
                .format(_authService.bankEpargne?.balance ?? 0),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
