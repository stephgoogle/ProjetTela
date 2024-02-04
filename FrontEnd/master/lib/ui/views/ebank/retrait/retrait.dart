import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/ui/views/ebank/retrait/retraitViewModel.dart';
import 'package:stacked/stacked.dart';

class Retrait extends StatefulWidget {
  const Retrait({super.key, required this.fromEpargne});
  final bool fromEpargne;

  @override
  State<Retrait> createState() => _RetraitState();
}

class _RetraitState extends State<Retrait> {
  bool enCours = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    return ViewModelBuilder<RetraitViewModel>.reactive(
      viewModelBuilder: () => RetraitViewModel(widget.fromEpargne),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Retrait',
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Retrait depuis le compte ${widget.fromEpargne ? 'Epargne' : 'Courant'}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  Visibility(
                    visible: model.insuffisant,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Votre solde est insuffisant pour éffectuer un retrait',
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
                        labelText: 'Montant du retrait',
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
                        if ((model.balance - (model.montant + model.frais)) <=
                            0) {
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
                        model.frais = (model.montant / 100) * 3;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  /// frais
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            'Frais',
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
                                .format(model.frais),
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                              color: Colors.deepOrange,
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
                            'Nouveau Solde',
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
                                .format(model.balance -
                                    (model.montant + model.frais)),
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

                  /// retrait
                  TextButton(
                    onPressed: () {
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
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 24.0, horizontal: 16),
                                        // child: Text('Effectuer un retrait de ${model.montant}?',
                                        child: Text(
                                          'Les retraits seront actifs Bientôt ne manquez pas nos mises à jour',
                                          textAlign: TextAlign.center,
                                          maxLines: 20,
                                          style: TextStyle(
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
                                                  Navigator.of(buildContext)
                                                      .pop();
                                                  // setState(() {
                                                  //   enCours = true;
                                                  // });
                                                  // model.retrait().whenComplete(() {
                                                  //   setState(() {
                                                  //     enCours = false;
                                                  //   });
                                                  // });
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
                            'Retrait',
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
