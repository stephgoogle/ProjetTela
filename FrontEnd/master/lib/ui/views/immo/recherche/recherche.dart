import 'package:flutter/material.dart';
import 'package:mobile/ui/views/immo/recherche/rechercheViewModel.dart';
import 'package:mobile/ui/widget/drawerWidget/telaDrawer.dart';
import 'package:stacked/stacked.dart';

class Recherche extends StatefulWidget {
  late bool isBureau;
  Recherche({super.key, required this.isBureau});

  @override
  State<Recherche> createState() => _RechercheState();
}

class _RechercheState extends State<Recherche> {
  int type = 1;
  String code = '';
  bool searching = false;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    return ViewModelBuilder<RechercheViewModel>.reactive(
      viewModelBuilder: () => RechercheViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            centerTitle: true,
            title: const Text(
              'Recherche',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.3,
                  color: Colors.white),
            ),
            elevation: 5,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
          ),
          drawer: TelaDrawer(
              base: widget.isBureau ? TelaDrawer.BUREAU : TelaDrawer.LOGEMENT),
          body: Form(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            widget.isBureau = !widget.isBureau;
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
                          widget.isBureau ? 'Bureau' : 'Logement',
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
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
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
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0, horizontal: 16),
                                            child: Text(
                                              commune.name,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxWidth: mq.size.width * 0.7),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        model.commune != null
                                            ? model.commune!.name
                                            : 'Sélectionnez une commune',
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontSize:
                                                model.commune != null ? 24 : 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 24,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ),

                    ///TYPE
                    const Divider(),
                    const Text(
                      'Type de Maison',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    const Divider(),

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
                          fillColor: MaterialStateProperty.all(Colors.black),
                          activeColor: Theme.of(context).colorScheme.primary),
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
                          fillColor: MaterialStateProperty.all(Colors.black),
                          activeColor: Theme.of(context).colorScheme.primary),
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
                          fillColor: MaterialStateProperty.all(Colors.black),
                          activeColor: Theme.of(context).colorScheme.primary),
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
                          fillColor: MaterialStateProperty.all(Colors.black),
                          activeColor: Theme.of(context).colorScheme.primary),
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
                          fillColor: MaterialStateProperty.all(Colors.black),
                          activeColor: Theme.of(context).colorScheme.primary),
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
                          fillColor: MaterialStateProperty.all(Colors.black),
                          activeColor: Theme.of(context).colorScheme.primary),
                    ),

                    /// IS Haut standing avec piscine
                    CheckboxListTile(
                        value: model.hasPiscine,
                        onChanged: (r) {
                          setState(() {
                            model.hasPiscine = r!;
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
                      'Nombre de pièces minimun',
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
                                if (model.nombreDePieces > 0) {
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
                      'Nombre de sales d\'eau minimun',
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
                                if (model.nombreDeSalleDeau > 0) {
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

                    // ///TYPE
                    // const Divider(),
                    // const Text('Commoditées additionnelles',
                    //   style: TextStyle(
                    //       color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),),
                    // const Divider(),
                    // /// IS Cours avant
                    // CheckboxListTile(
                    //     value: model.hasCoursAvant,
                    //   onChanged: (r) {
                    //     setState(() {
                    //       model.hasCoursAvant = r!;
                    //     });
                    //   },
                    //   title: Text(
                    //     "Cours Avant",
                    //     style: TextStyle(
                    //         color: Theme.of(context).colorScheme.primary, fontSize: 14, fontWeight: FontWeight.w500),
                    //   ),
                    //     checkColor: Colors.white,
                    //     activeColor: Theme.of(context).colorScheme.primary
                    // ),
                    // /// IS Cours Arriere
                    // CheckboxListTile(
                    //     value: model.hasCoursArriere,
                    //   onChanged: (r) {
                    //     setState(() {
                    //       model.hasCoursArriere = r!;
                    //     });
                    //   },
                    //   title: Text(
                    //     "Cours Arriere",
                    //     style: TextStyle(
                    //         color: Theme.of(context).colorScheme.primary, fontSize: 14, fontWeight: FontWeight.w500),
                    //   ),
                    //     checkColor: Colors.white,
                    //     activeColor: Theme.of(context).colorScheme.primary
                    // ),
                    // /// IS balcon avant
                    // CheckboxListTile(
                    //     value: model.hasBalconAvant,
                    //   onChanged: (r) {
                    //     setState(() {
                    //       model.hasBalconAvant = r!;
                    //     });
                    //   },
                    //   title: Text(
                    //     "Balcon Avant",
                    //     style: TextStyle(
                    //         color: Theme.of(context).colorScheme.primary, fontSize: 14, fontWeight: FontWeight.w500),
                    //   ),
                    //     checkColor: Colors.white,
                    //     activeColor: Theme.of(context).colorScheme.primary
                    // ),
                    // /// IS Balcon Arriere
                    // CheckboxListTile(
                    //     value: model.hasBalconArriere,
                    //   onChanged: (r) {
                    //     setState(() {
                    //       model.hasBalconArriere = r!;
                    //     });
                    //   },
                    //   title: Text(
                    //     "Balcon Arriere",
                    //     style: TextStyle(
                    //         color: Theme.of(context).colorScheme.primary, fontSize: 14, fontWeight: FontWeight.w500),
                    //   ),
                    //     checkColor: Colors.white,
                    //     activeColor: Theme.of(context).colorScheme.primary
                    // ),
                    // /// IS Piscine
                    // // CheckboxListTile(
                    // //     value: model.hasPiscine,
                    // //   onChanged: (r) {
                    // //     setState(() {
                    // //       model.hasPiscine = r!;
                    // //     });
                    // //   },
                    // //   title: Text(
                    // //     "Piscine",
                    // //     style: TextStyle(
                    // //         color: Theme.of(context).colorScheme.primary, fontSize: 14, fontWeight: FontWeight.w500),
                    // //   ),
                    // //     checkColor: Colors.white,
                    // //     activeColor: Theme.of(context).colorScheme.primary
                    // // ),
                    // /// IS GARAGE
                    // CheckboxListTile(
                    //     value: model.hasGarage,
                    //   onChanged: (r) {
                    //     setState(() {
                    //       model.hasGarage = r!;
                    //     });
                    //   },
                    //   title: Text(
                    //     "Garage",
                    //     style: TextStyle(
                    //         color: Theme.of(context).colorScheme.primary, fontSize: 14, fontWeight: FontWeight.w500),
                    //   ),
                    //     checkColor: Colors.white,
                    //     activeColor: Theme.of(context).colorScheme.primary
                    // ),
                    // /// has Gardien
                    // CheckboxListTile(
                    //     value: model.hasGardien,
                    //   onChanged: (r) {
                    //     setState(() {
                    //       model.hasGardien = r!;
                    //     });
                    //   },
                    //   title: Text(
                    //     "Gardien",
                    //     style: TextStyle(
                    //         color: Theme.of(context).colorScheme.primary, fontSize: 14, fontWeight: FontWeight.w500),
                    //   ),
                    //     checkColor: Colors.white,
                    //     activeColor: Theme.of(context).colorScheme.primary
                    // ),

                    ///Search
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          if (model.commune != null) {
                            if (model.authService.passVisite != null) {
                              setState(() {
                                setState(() {
                                  searching = true;
                                });
                              });
                              model.search().then((value) {
                                setState(() {
                                  searching = false;
                                });
                              });
                            } else {
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
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12.0,
                                                  horizontal: 16),
                                              child: Text(
                                                'Entrez le code de votre pass visite si dessous pour vérification',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 1.1),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(24.0),
                                              child: SizedBox(
                                                width: mq.size.width * 0.7,
                                                child: TextFormField(
                                                  autofocus: true,
                                                  maxLength: 8,
                                                  minLines: 1,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                  decoration: InputDecoration(
                                                    icon: Icon(
                                                      Icons.credit_card,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                    ),
                                                    suffix: InkWell(
                                                      onTap: () async =>
                                                          await model
                                                              .chechPass(code)
                                                              .then((v) {
                                                        Navigator.of(
                                                                buildContext)
                                                            .pop();
                                                      }),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        decoration: BoxDecoration(
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .primary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Text(
                                                            'vérifier',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                letterSpacing:
                                                                    1.1),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    labelText: 'Pass visites',
                                                    labelStyle: Theme.of(
                                                            context)
                                                        .inputDecorationTheme
                                                        .labelStyle,
                                                    enabledBorder: Theme.of(
                                                            context)
                                                        .inputDecorationTheme
                                                        .enabledBorder,
                                                    focusedBorder: Theme.of(
                                                            context)
                                                        .inputDecorationTheme
                                                        .focusedBorder,
                                                    hintStyle: Theme.of(context)
                                                        .inputDecorationTheme
                                                        .hintStyle,
                                                  ),
                                                  onChanged: (value) {
                                                    code = value;
                                                  },
                                                  // validator: (value) {
                                                  //
                                                  // },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextButton(
                                                  onPressed: () => model
                                                      .navigateToVisiteAbonnement(
                                                          true),
                                                  child: Text(
                                                    'Acheter un pass',
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600),
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
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12.0,
                                                  horizontal: 16),
                                              child: Text(
                                                'Vous devez sélectionner la commmune d\'Abidjan dans laquelle vous voullez effectuer la recherche.',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 1.1),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextButton(
                                                  onPressed: () =>
                                                      Navigator.of(buildContext)
                                                          .pop(),
                                                  child: Text(
                                                    'OK',
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
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
                          visible: !searching,
                          replacement: const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                          child: const Text(
                            'Rechercher',
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
          )),
    );
  }
}
