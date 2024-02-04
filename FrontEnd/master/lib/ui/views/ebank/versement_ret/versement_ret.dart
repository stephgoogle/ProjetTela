import 'package:flutter/material.dart';
import 'package:mobile/ui/views/ebank/versement_ret/versementRetViewModel.dart';
import 'package:stacked/stacked.dart';

class VersementRet extends StatefulWidget {
  const VersementRet({super.key});

  @override
  State<VersementRet> createState() => _VersementRetState();
}

class _VersementRetState extends State<VersementRet> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    return ViewModelBuilder<VersementRetViewModel>.reactive(
      viewModelBuilder: () => VersementRetViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Retirer',
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
          child: SizedBox(
            height: mq.size.height * 0.8,
            child: Column(
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
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'X0F ${model.authService.bankEpargne?.balance ?? 0}',
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
                      labelText: 'Montant à envoyer sur le compte courant',
                      labelStyle:
                          Theme.of(context).inputDecorationTheme.labelStyle,
                      enabledBorder:
                          Theme.of(context).inputDecorationTheme.enabledBorder,
                      focusedBorder:
                          Theme.of(context).inputDecorationTheme.focusedBorder,
                      hintStyle:
                          Theme.of(context).inputDecorationTheme.hintStyle,
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
                          'X0F ${(model.authService.bankEpargne?.balance ?? 0) - model.montant}',
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
                  onPressed: () async => await model.authService
                      .postVersementToEpargne(
                          amount: model.montant,
                          profile: model.authService.bankProfile!)
                      .whenComplete(() => model.navigateToBank()),
                  style: TextButton.styleFrom(
                    elevation: 8,
                    minimumSize: Size(mq.size.width * 0.7, 30),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
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
    );
  }
}
