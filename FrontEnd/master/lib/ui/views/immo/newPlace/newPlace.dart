import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile/ui/views/immo/newPlace/newPlaveViewModel.dart';
import 'package:stacked/stacked.dart';

class NewPlace extends StatefulWidget {
  const NewPlace({super.key});

  @override
  State<NewPlace> createState() => _NewPlaceState();
}

class _NewPlaceState extends State<NewPlace> {
  bool isBureau = false;

  bool loading = false;

  int type = 1;
  String code = '';

  List<String> imgLink = [];
  List<File> img = [];

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    return ViewModelBuilder<NewPlaceViewModel>.reactive(
      viewModelBuilder: () => NewPlaceViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            centerTitle: true,
            title: const Text(
              'Ajouter',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.3,
                  color: Colors.white),
            ),
            elevation: 5,
            leading: InkWell(
              onTap: () => model.navigateToCatalogue(),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
          ),
          body: Form(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Divider(),
                        const Text(
                          'Type de maison',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        const Divider(),

                        /// is bureau
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                isBureau = !isBureau;
                              });
                            },
                            style: TextButton.styleFrom(
                              fixedSize: Size.fromWidth(mq.size.width * 0.6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: Colors.white,
                              elevation: 8,
                            ),
                            child: Text(
                              isBureau ? 'Bureau' : 'Logement',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2),
                            ),
                          ),
                        ),

                        const Divider(),
                        const Text(
                          'Photos',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        const Divider(),
                        SizedBox(
                          height: mq.size.width,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: model.images.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    child: model.images[index] != null
                                        ? Image.file(
                                            model.images[index]!,
                                            fit: BoxFit.contain,
                                          )
                                        : SizedBox(
                                            height: mq.size.width * 0.8,
                                            width: mq.size.width * 0.8,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                child: index != 0
                                                    ? const Icon(
                                                        Icons.add,
                                                        size: 24,
                                                      )
                                                    : const Text(
                                                        'Facade de la maison',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Colors.black),
                                                      ),
                                              ),
                                            ),
                                          ),
                                    onTap: () async {
                                      model
                                          .navigateToCameraView(index)
                                          .whenComplete(() => setState(() {}));
                                      // await model.pickImage(index).whenComplete(() {
                                      //   setState(() {
                                      //
                                      //   });
                                      // });
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        const Divider(),
                        const Text(
                          'Status',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        const Divider(),

                        /// Occuupé?
                        CheckboxListTile(
                            value: model.isOccupe,
                            onChanged: (r) {
                              setState(() {
                                model.isOccupe = r!;
                              });
                            },
                            title: Text(
                              "Actuellement opccupé",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            checkColor: Colors.white,
                            activeColor: Theme.of(context).colorScheme.primary),

                        const Divider(),
                        const Text(
                          'Loyer',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        const Divider(),

                        /// Prix
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            initialValue: '0',
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.attach_money,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                labelText: 'Prix',
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
                                suffixText: 'F CFA'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vous devez entrer Le Loyer';
                              }
                              if (value == '0') {
                                return 'Vous devez entrer un Loyer supérieur a zero (0)';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              model.prix = value;
                            },
                          ),
                        ),

                        const Divider(),
                        const Text(
                          'Commune',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        const Divider(),

                        /// Commune
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PopupMenuButton(
                              color: Colors.white,
                              onSelected: (commm) {
                                setState(() {
                                  model.commune = commm;
                                });
                              },
                              offset: const Offset(100, 0),
                              itemBuilder: (BuildContext context) =>
                                  model.communes
                                      .map((commune) => PopupMenuItem(
                                            value: commune,
                                            child: Text(
                                              commune.name,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ))
                                      .toList(),
                              child: Text(
                                model.commune.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600),
                              )),
                        ),

                        ///TYPE
                        const Divider(),
                        const Text(
                          'Caractéristique',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        const Divider(),

                        /// IS APPARTEMENT
                        ListTile(
                          title: Text(
                            "Appartement",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          leading: Radio(
                              value: 1,
                              groupValue: type,
                              onChanged: (value) {
                                setState(() {
                                  type = 1;
                                  model.isAppart = true;
                                  model.isDuplex = false;
                                  model.isMaisonBasse = false;
                                  model.isStudio = false;
                                  model.isChambre = false;
                                  model.isResidence = false;
                                });
                              },
                              fillColor:
                                  MaterialStateProperty.all(Colors.black),
                              activeColor:
                                  Theme.of(context).colorScheme.primary),
                        ),
                        ListTile(
                          title: Text(
                            "Maison basse",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          leading: Radio(
                              value: 2,
                              groupValue: type,
                              onChanged: (value) {
                                setState(() {
                                  type = 2;
                                  model.isAppart = false;
                                  model.isDuplex = false;
                                  model.isMaisonBasse = true;
                                  model.isStudio = false;
                                  model.isChambre = false;
                                  model.isResidence = false;
                                });
                              },
                              fillColor:
                                  MaterialStateProperty.all(Colors.black),
                              activeColor:
                                  Theme.of(context).colorScheme.primary),
                        ),
                        ListTile(
                          title: Text(
                            "Duplex",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          leading: Radio(
                              value: 3,
                              groupValue: type,
                              onChanged: (value) {
                                setState(() {
                                  type = 3;
                                  model.isAppart = false;
                                  model.isDuplex = true;
                                  model.isMaisonBasse = false;
                                  model.isStudio = false;
                                  model.isChambre = false;
                                  model.isResidence = false;
                                });
                              },
                              fillColor:
                                  MaterialStateProperty.all(Colors.black),
                              activeColor:
                                  Theme.of(context).colorScheme.primary),
                        ),
                        ListTile(
                          title: Text(
                            "Résidence",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          leading: Radio(
                              value: 4,
                              groupValue: type,
                              onChanged: (value) {
                                setState(() {
                                  type = 4;
                                  model.isAppart = false;
                                  model.isDuplex = false;
                                  model.isMaisonBasse = false;
                                  model.isStudio = false;
                                  model.isChambre = false;
                                  model.isResidence = true;
                                });
                              },
                              fillColor:
                                  MaterialStateProperty.all(Colors.black),
                              activeColor:
                                  Theme.of(context).colorScheme.primary),
                        ),
                        ListTile(
                          title: Text(
                            "Studio",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          leading: Radio(
                              value: 5,
                              groupValue: type,
                              onChanged: (value) {
                                setState(() {
                                  type = 5;
                                  model.isAppart = false;
                                  model.isDuplex = false;
                                  model.isMaisonBasse = false;
                                  model.isStudio = true;
                                  model.isChambre = false;
                                  model.isResidence = false;
                                });
                              },
                              fillColor:
                                  MaterialStateProperty.all(Colors.black),
                              activeColor:
                                  Theme.of(context).colorScheme.primary),
                        ),
                        ListTile(
                          title: Text(
                            "Chambre",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          leading: Radio(
                              value: 6,
                              groupValue: type,
                              onChanged: (value) {
                                setState(() {
                                  type = 6;
                                  model.isAppart = false;
                                  model.isDuplex = false;
                                  model.isMaisonBasse = false;
                                  model.isStudio = false;
                                  model.isChambre = true;
                                  model.isResidence = false;
                                });
                              },
                              fillColor:
                                  MaterialStateProperty.all(Colors.black),
                              activeColor:
                                  Theme.of(context).colorScheme.primary),
                        ),

                        /// IS Haut standing avec piscine
                        CheckboxListTile(
                            value: model.isHautStandingPicine,
                            onChanged: (r) {
                              setState(() {
                                model.isHautStandingPicine = r!;
                              });
                            },
                            title: Text(
                              "Haut standing avec piscine",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            checkColor: Colors.white,
                            activeColor: Theme.of(context).colorScheme.primary),

                        /// IS Haut standing sans piscine
                        CheckboxListTile(
                            value: model.isHautStanding,
                            onChanged: (r) {
                              setState(() {
                                model.isHautStanding = r!;
                              });
                            },
                            title: Text(
                              "Haut standing sans piscine",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            checkColor: Colors.white,
                            activeColor: Theme.of(context).colorScheme.primary),

                        /// NOMBRE DE PIECE
                        const Divider(),
                        const Text(
                          'Nombre de pièces',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (model.nombreDePieces > 1) {
                                      model.nombreDePieces--;
                                    }
                                  });
                                },
                                icon: const Icon(Icons.remove)),
                            Text(
                              '${model.nombreDePieces}',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (model.nombreDePieces < 40) {
                                      model.nombreDePieces++;
                                    }
                                  });
                                },
                                icon: const Icon(Icons.add)),
                          ],
                        ),

                        /// NOMBRE DE PIECE d'eau
                        const Divider(),
                        const Text(
                          'Nombre de salles d\'eau',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (model.nombreDeSalleDeau > 1) {
                                      model.nombreDeSalleDeau--;
                                    }
                                  });
                                },
                                icon: const Icon(Icons.remove)),
                            Text(
                              '${model.nombreDeSalleDeau}',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (model.nombreDeSalleDeau < 40) {
                                      model.nombreDeSalleDeau++;
                                    }
                                  });
                                },
                                icon: const Icon(Icons.add)),
                          ],
                        ),

                        ///TYPE
                        const Divider(),
                        const Text(
                          'Commoditées additionnelles',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        const Divider(),

                        /// Has Cours avant
                        CheckboxListTile(
                            value: model.hasCoursAvant,
                            onChanged: (r) {
                              setState(() {
                                model.hasCoursAvant = r!;
                              });
                            },
                            title: Text(
                              "Cours Avant",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            checkColor: Colors.white,
                            activeColor: Theme.of(context).colorScheme.primary),

                        /// Has Cours Arriere
                        CheckboxListTile(
                            value: model.hasCoursArriere,
                            onChanged: (r) {
                              setState(() {
                                model.hasCoursArriere = r!;
                              });
                            },
                            title: Text(
                              "Cours Arriere",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            checkColor: Colors.white,
                            activeColor: Theme.of(context).colorScheme.primary),

                        /// Has balcon avant
                        CheckboxListTile(
                            value: model.hasBalconAvant,
                            onChanged: (r) {
                              setState(() {
                                model.hasBalconAvant = r!;
                              });
                            },
                            title: Text(
                              "Balcon Avant",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            checkColor: Colors.white,
                            activeColor: Theme.of(context).colorScheme.primary),

                        /// Has Balcon Arriere
                        CheckboxListTile(
                            value: model.hasBalconArriere,
                            onChanged: (r) {
                              setState(() {
                                model.hasBalconArriere = r!;
                              });
                            },
                            title: Text(
                              "Balcon Arriere",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            checkColor: Colors.white,
                            activeColor: Theme.of(context).colorScheme.primary),

                        /// Has GARAGE
                        CheckboxListTile(
                            value: model.hasGarage,
                            onChanged: (r) {
                              setState(() {
                                model.hasGarage = r!;
                              });
                            },
                            title: Text(
                              "Garage",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            checkColor: Colors.white,
                            activeColor: Theme.of(context).colorScheme.primary),

                        /// has Gardien
                        CheckboxListTile(
                            value: model.hasGardien,
                            onChanged: (r) {
                              setState(() {
                                model.hasGardien = r!;
                              });
                            },
                            title: Text(
                              "Gardien",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            checkColor: Colors.white,
                            activeColor: Theme.of(context).colorScheme.primary),

                        ///Description
                        const Divider(),
                        const Text(
                          'Description',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        const Divider(),

                        /// description field
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16.0),
                            maxLines: 3,
                            decoration: InputDecoration(
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.center,
                                icon: Icon(
                                  Icons.description,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 16.0,
                                ),
                                labelText: 'Description',
                                labelStyle: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintStyle: const TextStyle(
                                  color: Colors.black,
                                )),
                            onChanged: (value) {
                              setState(() {
                                model.description = value;
                              });
                            },
                          ),
                        ),

                        const Divider(),
                        const Text(
                          'Information du propriétaire (facultatifs)',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),

                        /// nom proprio
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            keyboardType: TextInputType.name,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.person_outline,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              labelText: 'Nom du propriétaire',
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
                            onChanged: (value) {
                              model.nomProprio = value;
                            },
                          ),
                        ),

                        /// phone field
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.phone_android,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              prefixText: '+225',
                              labelText: 'Numéro de téléphone du propriétaire',
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
                            onChanged: (value) {
                              model.phone = value;
                            },
                          ),
                        ),

                        ///Search
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  loading = true;
                                });
                                model
                                    .addPlace()
                                    .then((us) => model.navigateToCatalogue())
                                    .catchError((error, trace) {
                                  setState(() {
                                    loading = false;
                                  });
                                  showDialog(
                                      context: context,
                                      builder: (buildContext) => Dialog(
                                            backgroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 24.0,
                                                      horizontal: 16),
                                                  child: Text(
                                                    error.toString(),
                                                    textAlign: TextAlign.center,
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
                                                      const EdgeInsets.all(8.0),
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
                                model.addPlace();
                              }
                            },
                            style: TextButton.styleFrom(
                              fixedSize: Size.fromWidth(mq.size.width * 0.6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              elevation: 8,
                            ),
                            child: Visibility(
                              visible: !loading,
                              replacement: const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                              child: const Text(
                                'Enregister',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
