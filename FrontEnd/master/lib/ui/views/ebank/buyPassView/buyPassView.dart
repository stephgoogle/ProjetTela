import 'package:flutter/material.dart';
import 'package:mobile/models/abonnementType.dart';
import 'package:mobile/models/transactions.dart';
import 'package:mobile/ui/views/ebank/buyPassView/buyPassViewModel.dart';
import 'package:stacked/stacked.dart';

import 'package:cinetpay/cinetpay.dart';
import 'package:get/get.dart';

class BuyPassView extends StatefulWidget {
  final PassType pass;
  const BuyPassView({super.key, required this.pass});

  @override
  State<BuyPassView> createState() => _BuyPassViewState();
}

class _BuyPassViewState extends State<BuyPassView> {
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
    return ViewModelBuilder<BuyPassViewModel>.reactive(
      viewModelBuilder: () => BuyPassViewModel(),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                show
                                    ? Icon(icon, color: color, size: 150)
                                    : Container(),
                                show ? Text(message!) : Container(),
                                show
                                    ? const SizedBox(height: 50.0)
                                    : Container(),
                                Text(
                                  'Payez votre ${widget.pass.name} \n ${widget.pass.numberOfVisites} Visites à ${widget.pass.price} FCFA',
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
                                  onPressed: () async {
                                    ///  call get transaction id

                                    await Get.to(CinetPayCheckout(
                                      title: 'Payment Pass Tela',
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
                                        'description':
                                            'Payment pass ${widget.pass.name} ',
                                      },
                                      waitResponse: (data) async {
                                        if (mounted) {
                                          print(
                                              'Payement..................................');
                                          response = data;
                                          // setState(() {
                                          //   print(response);
                                          //   icon = data['status'] == 'ACCEPTED'
                                          //       ? Icons.check_circle
                                          //       : Icons.mood_bad_rounded;
                                          //   color = data['status'] == 'ACCEPTED'
                                          //       ? Colors.green
                                          //       : Colors.redAccent;
                                          //   show = true;
                                          // });
                                          /// send abonnement
                                          if (data['status'] == 'ACCEPTED') {
                                            transaction = TelaTransaction(
                                                id: 0,
                                                type: widget.pass.isVisite
                                                    ? 'PassVisite'
                                                    : 'passTv',
                                                paymentWay:
                                                    data['payment_method '] ??
                                                        'CinetPay',
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
                                            .pushTransaction(
                                                transaction!, widget.pass)
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
                                                              'Notez bien lz code ci-dessous! \nUne fois perdu il ne peut être récupéré.',
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
                                                                  ? 'Pass : ${value.code}'
                                                                  : 'erreur innatendue',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 20,
                                                              style: const TextStyle(
                                                                  fontSize: 18,
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
                                                    )))
                                            .catchError((error, trace) {
                                          showDialog(
                                              context: context,
                                              builder: (buildContext) => Dialog(
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
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical:
                                                                      24.0,
                                                                  horizontal:
                                                                      16),
                                                          child: Text(
                                                            error.toString(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            maxLines: 20,
                                                            style: const TextStyle(
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
                                                                    fontSize:
                                                                        18,
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
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Payer avec CinetPay',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                show
                                    ? Icon(icon, color: color, size: 150)
                                    : Container(),
                                show ? Text(message!) : Container(),
                                show
                                    ? const SizedBox(height: 50.0)
                                    : Container(),
                                Text(
                                  'Payez votre ${widget.pass.name} \n ${widget.pass.numberOfVisites} Visites à ${widget.pass.price} FCFA',
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
                                  onPressed: () async {
                                    ///  call get transaction id

                                    await Get.to(CinetPayCheckout(
                                      title: 'Payment Pass Tela',
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
                                        // 'amount': widget.pass.price,
                                        'currency': 'XOF',
                                        'channels': 'ALL',
                                        'description':
                                            'Payment pass ${widget.pass.name} ',
                                      },
                                      waitResponse: (data) async {
                                        if (mounted) {
                                          print(
                                              'Payement..................................');
                                          response = data;
                                          // setState(() {
                                          //   print(response);
                                          //   icon = data['status'] == 'ACCEPTED'
                                          //       ? Icons.check_circle
                                          //       : Icons.mood_bad_rounded;
                                          //   color = data['status'] == 'ACCEPTED'
                                          //       ? Colors.green
                                          //       : Colors.redAccent;
                                          //   show = true;
                                          // });
                                          /// send abonnement
                                          if (data['status'] == 'ACCEPTED') {
                                            transaction = TelaTransaction(
                                                id: 0,
                                                type: widget.pass.isVisite
                                                    ? 'PassVisite'
                                                    : 'passTv',
                                                paymentWay:
                                                    data['payment_method '] ??
                                                        'CinetPay',
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
                                            .pushTransaction(
                                                transaction!, widget.pass)
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
                                                              'Notez bien lz code ci-dessous! \nUne fois perdu il ne peut être récupéré.',
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
                                                                  ? 'Pass : ${value.code}'
                                                                  : 'erreur innatendue',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 20,
                                                              style: const TextStyle(
                                                                  fontSize: 18,
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
                                                    )))
                                            .catchError((error, trace) {
                                          showDialog(
                                              context: context,
                                              builder: (buildContext) => Dialog(
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
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical:
                                                                      24.0,
                                                                  horizontal:
                                                                      16),
                                                          child: Text(
                                                            error.toString(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            maxLines: 20,
                                                            style: const TextStyle(
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
                                                                    fontSize:
                                                                        18,
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
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Payer avec CinetPay',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
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
