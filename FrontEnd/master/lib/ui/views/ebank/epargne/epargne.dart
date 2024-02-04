import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/ui/views/ebank/epargne/epargneViewModel.dart';
import 'package:stacked/stacked.dart';

class Epargne extends StatefulWidget {
  const Epargne({super.key});

  @override
  State<Epargne> createState() => _EpargneState();
}

class _EpargneState extends State<Epargne> {
  final AuthService _authService = locator<AuthService>();
  bool isShowDay = false;

  double balance() {
    double d = 0;
    if (_authService.user != null) {
      d = isShowDay ? _authService.user?.balance ?? 0 : 0;
    } else {
      d = _authService.bankProfile?.balance ?? 0;
    }
    return d;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EpargneViewModel>.reactive(
      viewModelBuilder: () => EpargneViewModel(),
      builder: (context, model, child) => Scrollbar(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Solde disponible',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                          color: Colors.grey),
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                            locale: 'fr_FR', name: 'F CFA', decimalDigits: 0)
                        .format(_authService.bankEpargne?.balance ?? 0),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () => model.retrait(),
                style: TextButton.styleFrom(
                  elevation: 8,
                  backgroundColor: Colors.deepOrange,
                  shape: const StadiumBorder(),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 32),
                  child: Text(
                    'Retrait',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () => model.depot(),
                style: TextButton.styleFrom(
                  elevation: 8,
                  backgroundColor: Colors.green,
                  shape: const StadiumBorder(),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 32),
                  child: Text(
                    'Dépot',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: model.authService.user != null,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    if (_authService.abonnement == null) {
                      if ((model.authService.bankEpargne?.balance ?? 0) > 0) {
                        model.renewAbonnement();
                      } else {
                        showDialog(
                            context: context,
                            builder: (buildContext) => Dialog(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(24.0),
                                        child: Text(
                                          'Vos fonds sont insuffisants pour procéder à la transaction!',
                                          maxLines: 3,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: Colors.deepOrange,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextButton(
                                            onPressed: () =>
                                                Navigator.pop(buildContext),
                                            child: Text(
                                              'Retour',
                                              maxLines: 2,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                      )
                                    ],
                                  ),
                                ));
                      }
                    } else {
                      showDialog(
                          context: context,
                          builder: (buildContext) => Dialog(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(24.0),
                                      child: Text(
                                        'Vous avez déja un abonnement en cours',
                                        maxLines: 3,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.deepOrange,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextButton(
                                          onPressed: () =>
                                              Navigator.pop(buildContext),
                                          child: Text(
                                            'Retour',
                                            maxLines: 2,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          )),
                                    )
                                  ],
                                ),
                              ));
                    }
                  },
                  style: TextButton.styleFrom(
                    elevation: 8,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: const StadiumBorder(),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Reabonnement',
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     TextButton(onPressed: () => model.retrait(),
            //       style: TextButton.styleFrom(
            //         elevation: 8,
            //         backgroundColor: Theme.of(context).colorScheme.primary,
            //         shape: StadiumBorder(),
            //       ),
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 32),
            //         child: Text('Retrait',
            //           style: TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.w600,
            //               letterSpacing: 1.2,
            //               color: Colors.white
            //           ),
            //         ),
            //       ),
            //     ),
            //     TextButton(onPressed: () => model.depot(),
            //       style: TextButton.styleFrom(
            //         elevation: 8,
            //         backgroundColor: Theme.of(context).colorScheme.primary,
            //         shape: StadiumBorder(),
            //       ),
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 32),
            //         child: Text('Dépot',
            //           style: TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.w600,
            //               letterSpacing: 1.2,
            //               color: Colors.white
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // TextButton(onPressed: () => model.verserSurCompte(),
            //   style: TextButton.styleFrom(
            //     elevation: 8,
            //     backgroundColor: Theme.of(context).colorScheme.primary,
            //     shape: const StadiumBorder(),
            //   ),
            //   child: const Padding(
            //     padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 32),
            //     child: Text('envoie vers compte courant',
            //       style: TextStyle(
            //           fontSize: 14,
            //           fontWeight: FontWeight.w600,
            //           letterSpacing: 1.2,
            //           color: Colors.white
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
