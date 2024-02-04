import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/ui/views/ebank/versement/versementViewModel.dart';
import 'package:stacked/stacked.dart';

class Versement extends StatefulWidget {
  const Versement({super.key});

  @override
  State<Versement> createState() => _VersementState();
}

class _VersementState extends State<Versement> {
  bool enCours = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    return ViewModelBuilder<VersementViewModel>.reactive(
      viewModelBuilder: () => VersementViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Epargner',
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Visibility(
                    visible: model.insuffisant,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Votre solde est insuffisant pour épargner',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                            color: Colors.red),
                      ),
                    ),
                  ),

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
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            NumberFormat.currency(
                                    locale: 'fr_FR',
                                    name: 'F CFA',
                                    decimalDigits: 0)
                                .format(model.balance),
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
                          const TextInputType.numberWithOptions(decimal: true),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.attach_money,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        labelText: 'Montant a épargner',
                        labelStyle:
                            Theme.of(context).inputDecorationTheme.labelStyle,
                        enabledBorder: Theme.of(context)
                            .inputDecorationTheme
                            .enabledBorder,
                        focusedBorder: Theme.of(context)
                            .inputDecorationTheme
                            .focusedBorder,
                        hintStyle:
                            Theme.of(context).inputDecorationTheme.hintStyle,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vous devez entrer le montant du dépot';
                        }
                        if ((model.balance - (model.montant)) <= 0) {
                          return 'Fonds insuffisant';
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
                            'Nouveau solde disponible',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            NumberFormat.currency(
                                    locale: 'fr_FR',
                                    name: 'F CFA',
                                    decimalDigits: 0)
                                .format(model.balance - model.montant),
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

                  /// SOLDE
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            'Nouveau solde épargne',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            NumberFormat.currency(
                                    locale: 'fr_FR',
                                    name: 'F CFA',
                                    decimalDigits: 0)
                                .format(
                                    (model.authService.bankEpargne?.balance ??
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

                  /// epargner
                  TextButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate() && !enCours) {
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
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 24.0, horizontal: 16),
                                        child: Text(
                                          'Effectuer un versement de ${model.montant} vers le compte épargne?',
                                          textAlign: TextAlign.center,
                                          maxLines: 20,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.1),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextButton(
                                                onPressed: () =>
                                                    Navigator.of(buildContext)
                                                        .pop(),
                                                child: const Text(
                                                  'Non',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      color: Colors.deepOrange,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    enCours = true;
                                                  });
                                                  model.authService
                                                      .postVersementToEpargne(
                                                          amount: model.montant,
                                                          profile: model
                                                              .authService
                                                              .bankProfile!)
                                                      .then((value) => model
                                                          .navigateToBank())
                                                      .whenComplete(() {
                                                    setState(() {
                                                      enCours = false;
                                                    });
                                                  }).catchError((error, trace) {
                                                    setState(() {
                                                      enCours = false;
                                                    });
                                                    showDialog(
                                                        context: context,
                                                        builder:
                                                            (buildContext) =>
                                                                Dialog(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
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
                                                                        child:
                                                                            Text(
                                                                          error
                                                                              .toString(),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          maxLines:
                                                                              20,
                                                                          style: const TextStyle(
                                                                              fontSize: 14,
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.w600,
                                                                              letterSpacing: 1.1),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                        child: TextButton(
                                                                            onPressed: () => Navigator.of(buildContext).pop(),
                                                                            child: Text(
                                                                              'Ok',
                                                                              maxLines: 2,
                                                                              style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 18, fontWeight: FontWeight.w600),
                                                                            )),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ));
                                                  });
                                                },
                                                child: Text(
                                                  'Oui',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ));
                      }
                    },
                    style: TextButton.styleFrom(
                      elevation: 8,
                      minimumSize: Size(mq.size.width * 0.7, 30),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: const StadiumBorder(),
                    ),
                    child: enCours
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            'Epargner',
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
