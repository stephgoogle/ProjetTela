import 'package:cinetpay/cinetpay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile/models/transactions.dart';
import 'package:mobile/ui/views/ebank/depot/depotViewModel.dart';
import 'package:stacked/stacked.dart';

class Depot extends StatefulWidget {
  const Depot({super.key});

  @override
  State<Depot> createState() => _DepotState();
}

class _DepotState extends State<Depot> {
  TextEditingController amountController = TextEditingController();
  Map<String, dynamic>? response;
  Color? color;
  IconData? icon;
  String? message;
  bool show = false;
  bool progress = false;
  TelaTransaction? transaction;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    return ViewModelBuilder<DepotViewModel>.reactive(
      viewModelBuilder: () => DepotViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Dépot',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.3,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          elevation: 5,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: mq.size.height * 0.8,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/fond_fin.jpg'),
                    fit: BoxFit.fill)),
            child: FutureBuilder<String>(
                future: model.getTransactioNumber(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? Column(
                          children: [
                            /// SOLDE DISPO
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Solde disponible',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      NumberFormat.currency(
                                              locale: 'fr_FR',
                                              name: 'F CFA',
                                              decimalDigits: 0)
                                          .format(model.authService.bankEpargne
                                                  ?.balance ??
                                              0),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),

                            /// amount field
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                initialValue: model.montant.toString(),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.attach_money,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  labelText: 'Montant du Dépot',
                                  labelStyle: Theme.of(context)
                                      .inputDecorationTheme
                                      .labelStyle,
                                  enabledBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .enabledBorder,
                                  focusedBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .focusedBorder,
                                  hintStyle: Theme.of(context)
                                      .inputDecorationTheme
                                      .hintStyle,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Vous devez entrer le montant du dépot';
                                  }
                                  if (double.parse(value) <= 100) {
                                    return 'Le montant du dépot doit être supérieur à 100 X0F';
                                  }
                                  if ((double.parse(value).toInt() % 5) != 0) {
                                    return 'Le montant du dépot doit être un multiple de 5';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  model.montant = double.parse(value);
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),

                            /// SOLDE
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    child: Text(
                                      'Nouveau Solde',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      NumberFormat.currency(
                                              locale: 'fr_FR',
                                              name: 'F CFA',
                                              decimalDigits: 0)
                                          .format((model.authService.bankEpargne
                                                      ?.balance ??
                                                  0) +
                                              model.montant),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),

                            /// depot
                            TextButton(
                              onPressed: () async {
                                await Get.to(CinetPayCheckout(
                                  title: 'Payment Tela',
                                  titleStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  titleBackgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  configData: <String, dynamic>{
                                    'apikey':
                                        '412126359654bb6ed651509.14435556',
                                    'site_id': int.parse("5865665"),
                                  },
                                  paymentData: <String, dynamic>{
                                    'transaction_id': snapshot.data!,
                                    'amount': model.montant,
                                    'currency': 'XOF',
                                    'channels': 'ALL',
                                    'description':
                                        'Dépot de XOF ${model.montant} sur le compte Tela',
                                  },
                                  waitResponse: (data) async {
                                    if (mounted) {
                                      response = data;

                                      /// send abonnement
                                      setState(() {
                                        print(response);
                                        icon = data['status'] == 'ACCEPTED'
                                            ? Icons.check_circle
                                            : Icons.mood_bad_rounded;
                                        color = data['status'] == 'ACCEPTED'
                                            ? Colors.green
                                            : Colors.redAccent;
                                        show = true;
                                      });

                                      if (data['status'] == 'ACCEPTED') {
                                        setState(() {
                                          progress = true;
                                        });

                                        /// create transaction
                                        transaction = TelaTransaction(
                                            id: 0,
                                            type: 'Depot',
                                            paymentWay:
                                                data['payment_method'] ??
                                                    'CinetPay',
                                            transactionNumber: snapshot.data!,
                                            operationId:
                                                data['operator_id'] ?? '',
                                            amount: double.parse(
                                                data['amount'] ??
                                                    model.montant),
                                            date: DateTime.tryParse(
                                                    data['payment_date']) ??
                                                DateTime.now());
                                        Get.back();
                                      }
                                    }
                                  },
                                  onError: (data) {
                                    if (mounted) {
                                      print('Error Payement');
                                      setState(() {
                                        response = data;
                                        message = response!['description'];
                                        print(response);
                                        icon = Icons.warning_rounded;
                                        color = Colors.yellowAccent;
                                        show = true;
                                        Get.back();
                                      });
                                    }
                                  },
                                ))?.then((value) async {
                                  if (transaction != null) {
                                    await model
                                        .depot(transaction!)
                                        .then((value) => showDialog(
                                            context: context,
                                            builder: (buildContext) => Dialog(
                                                  backgroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 24.0,
                                                                horizontal: 16),
                                                        child: Text(
                                                          'Votre Dépot de la somme de ${model.montant} a bien été effectué',
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 20,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  letterSpacing:
                                                                      1.1),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: TextButton(
                                                            onPressed: () => model
                                                                .navigateToBank(),
                                                            child: Text(
                                                              'Ok',
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .primary,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            )),
                                                      )
                                                    ],
                                                  ),
                                                )))
                                        .catchError((error, trace) {
                                      showDialog(
                                          context: context,
                                          builder: (buildContext) => Dialog(
                                                backgroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 24.0,
                                                          horizontal: 16),
                                                      child: Text(
                                                        error.toString(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 20,
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            letterSpacing: 1.1),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: TextButton(
                                                          onPressed: () =>
                                                              Navigator.of(
                                                                      buildContext)
                                                                  .pop(),
                                                          child: Text(
                                                            'Ok',
                                                            maxLines: 2,
                                                            style: TextStyle(
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .primary,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              ));
                                    });
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (buildContext) => Dialog(
                                              backgroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 24.0,
                                                            horizontal: 16),
                                                    child: Text(
                                                      'Erreur innatendu!',
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 5,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 1.1),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: TextButton(
                                                        onPressed: () => model
                                                            .navigateToProfile(),
                                                        child: Text(
                                                          'Ok',
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .primary,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ));
                                  }
                                });
                              },
                              style: TextButton.styleFrom(
                                elevation: 8,
                                minimumSize: Size(mq.size.width * 0.7, 30),
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                shape: const StadiumBorder(),
                              ),
                              child: const Text(
                                'Dépot',
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Center(child: const CircularProgressIndicator());
                }),
          ),
        ),
      ),
    );
  }
}
