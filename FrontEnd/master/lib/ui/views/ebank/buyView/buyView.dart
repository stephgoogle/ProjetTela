import 'package:cinetpay/cinetpay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/models/abonnementType.dart';
import 'package:mobile/models/transactions.dart';
import 'package:mobile/ui/views/ebank/buyView/buyViewModel.dart';
import 'package:stacked/stacked.dart';

class BuyView extends StatefulWidget {
  final AbonnementType abonement;
  const BuyView({super.key, required this.abonement});

  @override
  State<BuyView> createState() => _BuyViewState();
}

class _BuyViewState extends State<BuyView> {
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
    return ViewModelBuilder<BuyViewModel>.reactive(
      viewModelBuilder: () => BuyViewModel(),
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
                  future: model.getTransactioNumber(),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? Center(
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
                                    '${widget.abonement.title} ${widget.abonement.type} : ${widget.abonement.price} FCFA',
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 40.0),
                                  ElevatedButton(
                                    onPressed: () async {
                                      await Get.to(() => CinetPayCheckout(
                                            title: ' Tela',
                                            titleStyle: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                            titleBackgroundColor:
                                                Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                            configData: <String, dynamic>{
                                              'apikey':
                                                  '60389553165b67378c84df8.22859924',
                                              'site_id': int.parse("5867817"),
                                            },
                                            paymentData: <String, dynamic>{
                                              'transaction_id': snapshot.data!,
                                              'amount': widget.abonement.price,
                                              'currency': 'XOF',
                                              'channels': 'ALL',
                                              'description':
                                                  'Payment Abonnement ${model.user!.phone}',
                                            },
                                            waitResponse: (data) async {
                                              if (mounted) {
                                                response = data;

                                                /// send abonnement

                                                if (data['status'] ==
                                                    'ACCEPTED') {
                                                  setState(() {
                                                    icon = data['status'] ==
                                                            'ACCEPTED'
                                                        ? Icons.check_circle
                                                        : Icons
                                                            .mood_bad_rounded;
                                                    color = data['status'] ==
                                                            'ACCEPTED'
                                                        ? Colors.green
                                                        : Colors.redAccent;
                                                    show = true;
                                                  });

                                                  /// create transaction
                                                  transaction = TelaTransaction(
                                                      id: 0,
                                                      type:
                                                          widget.abonement.type,
                                                      paymentWay:
                                                          data['payment_method '] ??
                                                              'Orange',
                                                      transactionNumber:
                                                          snapshot.data!,
                                                      operationId:
                                                          data['operator_id'] ??
                                                              '',
                                                      amount: double.parse(
                                                          data['amount'] ??
                                                              widget.abonement
                                                                  .price),
                                                      date: DateTime.tryParse(data[
                                                              'payment_date']) ??
                                                          DateTime.now());
                                                  Get.back();

                                                  /// save transaction to server and pop out after dialog
                                                }
                                              }
                                            },
                                            onError: (data) {
                                              if (mounted) {
                                                setState(() {
                                                  response = data;
                                                  message =
                                                      response!['description'];
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
                                                  widget.abonement)
                                              .then((value) => showDialog(
                                                  context: context,
                                                  builder: (buildContext) =>
                                                      Dialog(
                                                        backgroundColor:
                                                            Colors.white,
                                                        shape: RoundedRectangleBorder(
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
                                                                'Votre réabonnement ${widget.abonement.title} a bien été effectué',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                maxLines: 20,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        14,
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
                                                                  onPressed:
                                                                      () => model
                                                                          .navigateToProfile(),
                                                                  child: Text(
                                                                    'Ok',
                                                                    maxLines: 2,
                                                                    style: TextStyle(
                                                                        color: Theme.of(context)
                                                                            .colorScheme
                                                                            .primary,
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  )),
                                                            )
                                                          ],
                                                        ),
                                                      )))
                                              .catchError((error, trace) {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (buildContext) => Dialog(
                                                          backgroundColor:
                                                              Colors.white,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30)),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        24.0,
                                                                    horizontal:
                                                                        16),
                                                                child: Text(
                                                                  error
                                                                      .toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  maxLines: 20,
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          14,
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
                                                                        .all(
                                                                        8.0),
                                                                child:
                                                                    TextButton(
                                                                        onPressed: () =>
                                                                            Navigator.of(buildContext)
                                                                                .pop(),
                                                                        child:
                                                                            Text(
                                                                          'Ok',
                                                                          maxLines:
                                                                              2,
                                                                          style: TextStyle(
                                                                              color: Theme.of(context).colorScheme.primary,
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.w600),
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
                                                            'Erreur innatendu!',
                                                            textAlign: TextAlign
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
                                        }
                                      });
                                    },
                                    style: TextButton.styleFrom(
                                      elevation: 8,
                                      minimumSize:
                                          Size(mq.size.width * 0.7, 30),
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      shape: const StadiumBorder(),
                                    ),
                                    child: const Text('Payer avec CinetPay',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600)),
                                  )
                                ],
                              ),
                            ],
                          ))
                        : const CircularProgressIndicator();

                    // switch(snapshot.connectionState) {
                    //   case ConnectionState.none:
                    //     return const Center(
                    //       child: CircularProgressIndicator(),
                    //     );
                    //   case ConnectionState.waiting:
                    //   return const Center(
                    //     child: CircularProgressIndicator(),
                    //   );
                    //   case ConnectionState.active:
                    //   return Center(
                    //       child: ListView(
                    //         shrinkWrap: true,
                    //         children: [
                    //           Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               show ? Icon(icon, color: color, size: 150) : Container(),
                    //               show ? Text(message!) : Container(),
                    //               show ? const SizedBox(height: 50.0) : Container(),
                    //               Text('${widget.abonement.title} ${widget.abonement.type} : ${widget.abonement.price} FCFA',
                    //                 style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    //                 textAlign: TextAlign.center,
                    //               ),
                    //               const SizedBox(height: 40.0),
                    //               ElevatedButton(
                    //                 style: TextButton.styleFrom(
                    //                   elevation: 8,
                    //                   minimumSize: Size(mq.size.width*0.7, 30),
                    //                   backgroundColor: Theme.of(context).colorScheme.primary,
                    //                   shape: const StadiumBorder(),
                    //                 ),
                    //                 child: Text('Payer ${widget.abonement.price} FCFA avec CinetPay',
                    //                     style: TextStyle(
                    //                         color: Colors.white,
                    //                         fontSize: 24,
                    //                         fontWeight: FontWeight.w600
                    //                     )),
                    //                 onPressed: () async {
                    //
                    //
                    //                   // print('Payement..................................');
                    //                   // /// send abonnement
                    //                   // TelaTransaction transaction = TelaTransaction(
                    //                   //   id: 0,
                    //                   //   type: widget.abonement.type,
                    //                   //   paymentWay: 'Orange',
                    //                   //   transactionNumber: snapshot.data!,
                    //                   //   operationId: 'ggggg',
                    //                   //   amount: widget.abonement.price.toDouble(),
                    //                   //   date: DateTime.now(),
                    //                   // );
                    //
                    //
                    //                   // await model.pushTransaction(transaction, widget.abonement);
                    //                   await Get.to(CinetPayCheckout(
                    //                     title: 'Payment Tela',
                    //                     titleStyle: const TextStyle(
                    //                         fontSize: 20, fontWeight: FontWeight.bold),
                    //                     titleBackgroundColor: Theme.of(context).colorScheme.primary,
                    //                     configData: <String, dynamic>{
                    //                       'apikey': '412126359654bb6ed651509.14435556',
                    //                       'site_id': int.parse("5865665"),
                    //                     },
                    //                     paymentData: <String, dynamic>{
                    //                       'transaction_id': snapshot.data!,
                    //                       'amount': widget.abonement.price,
                    //                       'currency': 'XOF',
                    //                       'channels': 'ALL',
                    //                       'description': 'Payment Abonnement ${model.user!.phone}',
                    //                     },
                    //                     waitResponse: (data) async {
                    //                       if (mounted) {
                    //                         response = data;
                    //                         /// send abonnement
                    //
                    //                         if (data['status'] == 'ACCEPTED') {
                    //                           /// create transaction
                    //                           TelaTransaction _transaction = TelaTransaction(
                    //                               id: 0,
                    //                               type: widget.abonement.type,
                    //                               paymentWay: data['payment_method ']??'Orange',
                    //                               transactionNumber: snapshot.data!,
                    //                               operationId: data['operator_id']??'',
                    //                               amount: double.parse(data['amount']??widget.abonement.price),
                    //                               date: data['date']??'2023-10-26'
                    //                           );
                    //
                    //                           await model.pushTransaction(_transaction, widget.abonement);
                    //
                    //
                    //
                    //                           /// save transaction to server and pop out after dialog
                    //
                    //                         }
                    //                         setState(() {
                    //                           print(response);
                    //                           icon = data['status'] == 'ACCEPTED'
                    //                               ? Icons.check_circle
                    //                               : Icons.mood_bad_rounded;
                    //                           color = data['status'] == 'ACCEPTED'
                    //                               ? Colors.green
                    //                               : Colors.redAccent;
                    //                           show = true;
                    //                           Get.back();
                    //                         });
                    //                       }
                    //                     },
                    //                     onError: (data) {
                    //                       if (mounted) {
                    //                         print('Error Payement');
                    //                         setState(() {
                    //                           response = data;
                    //                           message = response!['description'];
                    //                           print(response);
                    //                           icon = Icons.warning_rounded;
                    //                           color = Colors.yellowAccent;
                    //                           show = true;
                    //                           Get.back();
                    //                         });
                    //                       }
                    //                     },
                    //                   ));
                    //                 },
                    //               )
                    //             ],
                    //           ),
                    //         ],
                    //       ));
                    //   case ConnectionState.done:
                    //     return Center(
                    //         child: ListView(
                    //           shrinkWrap: true,
                    //           children: [
                    //             Column(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               children: [
                    //                 show ? Icon(icon, color: color, size: 150) : Container(),
                    //                 show ? Text(message!) : Container(),
                    //                 show ? const SizedBox(height: 50.0) : Container(),
                    //                 Text('${widget.abonement.title} ${widget.abonement.type} : ${widget.abonement.price} FCFA',
                    //                   style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    //                   textAlign: TextAlign.center,
                    //                 ),
                    //                 const SizedBox(height: 40.0),
                    //                 ElevatedButton(
                    //                   style: TextButton.styleFrom(
                    //                     elevation: 8,
                    //                     minimumSize: Size(mq.size.width*0.7, 30),
                    //                     backgroundColor: Theme.of(context).colorScheme.primary,
                    //                     shape: const StadiumBorder(),
                    //                   ),
                    //                   child: Text('Payer ${widget.abonement.price} FCFA avec CinetPay',
                    //                       style: TextStyle(
                    //                           color: Colors.white,
                    //                           fontSize: 24,
                    //                           fontWeight: FontWeight.w600
                    //                       )),
                    //                   onPressed: () async {
                    //
                    //
                    //                     // print('Payement..................................');
                    //                     // /// send abonnement
                    //                     // TelaTransaction transaction = TelaTransaction(
                    //                     //   id: 0,
                    //                     //   type: widget.abonement.type,
                    //                     //   paymentWay: 'Orange',
                    //                     //   transactionNumber: snapshot.data!,
                    //                     //   operationId: 'ggggg',
                    //                     //   amount: widget.abonement.price.toDouble(),
                    //                     //   date: DateTime.now(),
                    //                     // );
                    //
                    //
                    //                     // await model.pushTransaction(transaction, widget.abonement);
                    //                     await Get.to(CinetPayCheckout(
                    //                       title: 'Payment Tela',
                    //                       titleStyle: const TextStyle(
                    //                           fontSize: 20, fontWeight: FontWeight.bold),
                    //                       titleBackgroundColor: Theme.of(context).colorScheme.primary,
                    //                       configData: <String, dynamic>{
                    //                         'apikey': '412126359654bb6ed651509.14435556',
                    //                         'site_id': int.parse("5865665"),
                    //                       },
                    //                       paymentData: <String, dynamic>{
                    //                         'transaction_id': snapshot.data!,
                    //                         'amount': widget.abonement.price,
                    //                         'currency': 'XOF',
                    //                         'channels': 'ALL',
                    //                         'description': 'Payment Abonnement ${model.user!.phone}',
                    //                       },
                    //                       waitResponse: (data) async {
                    //                         if (mounted) {
                    //                           response = data;
                    //                           /// send abonnement
                    //
                    //                           if (data['status'] == 'ACCEPTED') {
                    //                             /// create transaction
                    //                             TelaTransaction _transaction = TelaTransaction(
                    //                                 id: 0,
                    //                                 type: widget.abonement.type,
                    //                                 paymentWay: data['payment_method ']??'Orange',
                    //                                 transactionNumber: snapshot.data!,
                    //                                 operationId: data['operator_id']??'',
                    //                                 amount: double.parse(data['amount']??widget.abonement.price),
                    //                                 date: data['date']??'2023-10-26'
                    //                             );
                    //
                    //                             await model.pushTransaction(_transaction, widget.abonement);
                    //
                    //
                    //
                    //                             /// save transaction to server and pop out after dialog
                    //
                    //                           }
                    //                           setState(() {
                    //                             print(response);
                    //                             icon = data['status'] == 'ACCEPTED'
                    //                                 ? Icons.check_circle
                    //                                 : Icons.mood_bad_rounded;
                    //                             color = data['status'] == 'ACCEPTED'
                    //                                 ? Colors.green
                    //                                 : Colors.redAccent;
                    //                             show = true;
                    //                             Get.back();
                    //                           });
                    //                         }
                    //                       },
                    //                       onError: (data) {
                    //                         if (mounted) {
                    //                           print('Error Payement');
                    //                           setState(() {
                    //                             response = data;
                    //                             message = response!['description'];
                    //                             print(response);
                    //                             icon = Icons.warning_rounded;
                    //                             color = Colors.yellowAccent;
                    //                             show = true;
                    //                             Get.back();
                    //                           });
                    //                         }
                    //                       },
                    //                     ));
                    //                   },
                    //                 )
                    //               ],
                    //             ),
                    //           ],
                    //         ));
                    // }
                  }))),
    );
  }
}
