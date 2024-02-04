import 'package:flutter/material.dart';
import 'package:mobile/models/place.dart';
import 'package:mobile/ui/views/immo/resultat/resultatViewModel.dart';
import 'package:mobile/ui/widget/place_card.dart';
import 'package:stacked/stacked.dart';

class Resultat extends StatefulWidget {
  const Resultat({super.key, required this.places});

  final List<TelaPlace> places;

  @override
  State<Resultat> createState() => _ResultatState();
}

class _ResultatState extends State<Resultat> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    return ViewModelBuilder<ResultatViewModel>.reactive(
      viewModelBuilder: () => ResultatViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Resultats', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          elevation: 5,
        ),
        backgroundColor: Colors.white,
        body: widget.places.isNotEmpty
            ? ListView(
                scrollDirection: Axis.vertical,
                children: widget.places
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                              onTap: () => showDialog(
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20.0,
                                                      horizontal: 16),
                                              child: Visibility(
                                                visible: !model
                                                    .passVisite!.isExpired,
                                                replacement: TextButton(
                                                  onPressed: () => {
                                                    Navigator.of(buildContext)
                                                        .pop(),
                                                    model
                                                        .navigateToVisiteAbonnement(
                                                            true),
                                                  },
                                                  child: const Text(
                                                    'Votre pass à expiré, cliquez ici pour en racheter un nouveau',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 1.1),
                                                  ),
                                                ),
                                                child: Text(
                                                  'Il vous reste ${model.passVisite!.numberOfVisites} maisons à Consulter',
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      letterSpacing: 1.1),
                                                ),
                                              ),
                                            ),
                                            Visibility(
                                              visible:
                                                  !model.passVisite!.isExpired,
                                              replacement: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: TextButton(
                                                    onPressed: () => {
                                                          Navigator.of(
                                                                  buildContext)
                                                              .pop(),
                                                          model
                                                              .navigateToVisite(
                                                                  e)
                                                        },
                                                    child: Text(
                                                      'Annuler',
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .primary,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: TextButton(
                                                    onPressed: () => {
                                                          Navigator.of(
                                                                  buildContext)
                                                              .pop(),
                                                          model
                                                              .navigateToVisite(
                                                                  e)
                                                        },
                                                    child: Text(
                                                      'Consulter',
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .primary,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )),
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                              child: PlaceCard(place: e, image: e.images[0])),
                        ))
                    .toList(),
              )
            : Center(
                child: Text(
                  'Aucuns résultats ne correspond à votre recherche!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1),
                ),
              ),
      ),
    );
  }
}
