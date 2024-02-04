import 'package:flutter/material.dart';
import 'package:mobile/models/abonnement.dart';
import 'package:mobile/models/abonnementType.dart';
import 'package:mobile/models/transactions.dart';
import 'package:mobile/ui/views/ebank/renewVisitePass/renewPassViewModel.dart';
import 'package:stacked/stacked.dart';

import 'package:cinetpay/cinetpay.dart';
import 'package:get/get.dart';

class RenewPassView extends StatefulWidget {
  final PassType pass;
  final PassVisite passVisite;
  const RenewPassView(
      {super.key, required this.pass, required this.passVisite});

  @override
  State<RenewPassView> createState() => _RenewPassViewState();
}

class _RenewPassViewState extends State<RenewPassView> {
  TextEditingController amountController = TextEditingController();
  Map<String, dynamic>? response;
  Color? color;
  IconData? icon;
  String? message;
  bool show = false;
  TelaTransaction? transaction;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    return ViewModelBuilder<RenewPassViewModel>.reactive(
      viewModelBuilder: () => RenewPassViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            centerTitle: true,
            title: const Text(
              'Payement',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.3,
                  color: Colors.white),
            ),
            elevation: 5,
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
          ),
          body: SafeArea(
              child: FutureBuilder<String>(
                  future: model.getTransactioNumber(widget.pass),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case ConnectionState.waiting:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case ConnectionState.active:
                        return Center(
                            child: ListView(
                          shrinkWrap: true,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                show
                                    ? Icon(icon, color: color, size: 150)
                                    : Container(),
                                show ? Text(message!) : Container(),
                                show
                                    ? const SizedBox(height: 50.0)
                                    : Container(),
                                Text(
                                  '${widget.pass.name} \n${widget.pass.numberOfVisites} Visites : ${widget.pass.price} FCFA',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 40.0),
                                ElevatedButton(
                                  style: TextButton.styleFrom(
                                    elevation: 8,
                                    minimumSize: Size(mq.size.width * 0.7, 30),
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                    shape: const StadiumBorder(),
                                  ),
                                  child: const Text('Payer avec CinetPay',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600)),
                                  onPressed: () async {
                                    ///  call get transaction id

                                    print(
                                        'Payement..................................');

                                    /// send abonnement
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
                                        'amount': widget.pass.price,
                                        'currency': 'XOF',
                                        'channels': 'ALL',
                                        'description': 'prolonge pass visite ',
                                      },
                                      waitResponse: (data) async {
                                        if (mounted) {
                                          response = data;
                                          if (data['status'] == 'ACCEPTED') {
                                            /// send abonnement
                                            transaction = TelaTransaction(
                                                id: 0,
                                                type: widget.pass.isVisite
                                                    ? 'PassVisite'
                                                    : 'passTv',
                                                paymentWay:
                                                    data['payment_method '] ??
                                                        'Cinetpay',
                                                transactionNumber:
                                                    snapshot.data!,
                                                operationId:
                                                    data['operator_id'] ?? '',
                                                amount: double.parse(
                                                    data['amount'] ??
                                                        widget.pass.price),
                                                date: DateTime.tryParse(
                                                        data['payment_date']) ??
                                                    DateTime.now());
                                            Get.back();
                                          }
                                        }
                                      },
                                      onError: (data) {
                                        if (mounted) {
                                          print('Erreur de payement Payement');
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
                                            .pushTransaction(transaction!,
                                                widget.pass, widget.passVisite)
                                            .then((value) => showDialog(
                                                context: context,
                                                builder: (buildContext) =>
                                                    Dialog(
                                                      backgroundColor:
                                                          Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30)),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          const Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        24.0,
                                                                    horizontal:
                                                                        16),
                                                            child: Text(
                                                              'Notez bien le code ci-dessous! \nUne fois perdu il ne peut être récupéré.',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 5,
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  letterSpacing:
                                                                      1.1),
                                                            ),
                                                          ),
                                                          const Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        24.0,
                                                                    horizontal:
                                                                        16),
                                                            child: Text(
                                                              'Le code de votre pass est:',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 2,
                                                              style: TextStyle(
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
                                                                    .symmetric(
                                                                    vertical:
                                                                        24.0,
                                                                    horizontal:
                                                                        16),
                                                            child: Text(
                                                              value != null
                                                                  ? ' ${value.code}'
                                                                  : 'erreur innatendue',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 20,
                                                              style: const TextStyle(
                                                                  fontSize: 24,
                                                                  color: Colors
                                                                      .deepOrange,
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
                                                                onPressed: () =>
                                                                    model
                                                                        .navigateToProfile(),
                                                                child: Text(
                                                                  'Ok',
                                                                  maxLines: 2,
                                                                  style: TextStyle(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .colorScheme
                                                                          .primary,
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                )),
                                                          )
                                                        ],
                                                      ),
                                                    )));
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
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 24.0,
                                                                horizontal: 16),
                                                        child: Text(
                                                          'Erreur innatendu!',
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 5,
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.black,
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
                                )
                              ],
                            ),
                          ],
                        ));
                      case ConnectionState.done:
                        return Center(
                            child: ListView(
                          shrinkWrap: true,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                show
                                    ? Icon(icon, color: color, size: 150)
                                    : Container(),
                                show ? Text(message!) : Container(),
                                show
                                    ? const SizedBox(height: 50.0)
                                    : Container(),
                                Text(
                                  '${widget.pass.name} \n${widget.pass.numberOfVisites} Visites : ${widget.pass.price} FCFA',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 40.0),
                                ElevatedButton(
                                  style: TextButton.styleFrom(
                                    elevation: 8,
                                    minimumSize: Size(mq.size.width * 0.7, 30),
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                    shape: const StadiumBorder(),
                                  ),
                                  child: const Text('Payer avec CinetPay',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600)),
                                  onPressed: () async {
                                    ///  call get transaction id

                                    print(
                                        'Payement..................................');

                                    /// send abonnement
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
                                        'amount': widget.pass.price,
                                        'currency': 'XOF',
                                        'channels': 'ALL',
                                        'description': 'prolonge pass visite ',
                                      },
                                      waitResponse: (data) async {
                                        if (mounted) {
                                          response = data;
                                          if (data['status'] == 'ACCEPTED') {
                                            /// send abonnement
                                            transaction = TelaTransaction(
                                                id: 0,
                                                type: widget.pass.isVisite
                                                    ? 'PassVisite'
                                                    : 'passTv',
                                                paymentWay:
                                                    data['payment_method '] ??
                                                        'Cinetpay',
                                                transactionNumber:
                                                    snapshot.data!,
                                                operationId:
                                                    data['operator_id'] ?? '',
                                                amount: double.parse(
                                                    data['amount'] ??
                                                        widget.pass.price),
                                                date: DateTime.tryParse(
                                                        data['payment_date']) ??
                                                    DateTime.now());
                                            Get.back();
                                          }
                                        }
                                      },
                                      onError: (data) {
                                        if (mounted) {
                                          print('Erreur de payement Payement');
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
                                            .pushTransaction(transaction!,
                                                widget.pass, widget.passVisite)
                                            .then((value) => showDialog(
                                                context: context,
                                                builder: (buildContext) =>
                                                    Dialog(
                                                      backgroundColor:
                                                          Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30)),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          const Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        24.0,
                                                                    horizontal:
                                                                        16),
                                                            child: Text(
                                                              'Notez bien le code ci-dessous! \nUne fois perdu il ne peut être récupéré.',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 5,
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  letterSpacing:
                                                                      1.1),
                                                            ),
                                                          ),
                                                          const Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        24.0,
                                                                    horizontal:
                                                                        16),
                                                            child: Text(
                                                              'Le code de votre pass est:',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 2,
                                                              style: TextStyle(
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
                                                                    .symmetric(
                                                                    vertical:
                                                                        24.0,
                                                                    horizontal:
                                                                        16),
                                                            child: Text(
                                                              value != null
                                                                  ? ' ${value.code}'
                                                                  : 'erreur innatendue',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 20,
                                                              style: const TextStyle(
                                                                  fontSize: 24,
                                                                  color: Colors
                                                                      .deepOrange,
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
                                                                onPressed: () =>
                                                                    model
                                                                        .navigateToProfile(),
                                                                child: Text(
                                                                  'Ok',
                                                                  maxLines: 2,
                                                                  style: TextStyle(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .colorScheme
                                                                          .primary,
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                )),
                                                          )
                                                        ],
                                                      ),
                                                    )));
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
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 24.0,
                                                                horizontal: 16),
                                                        child: Text(
                                                          'Erreur innatendu!',
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 5,
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.black,
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
                                )
                              ],
                            ),
                          ],
                        ));
                    }
                  }))),
    );
  }
}
