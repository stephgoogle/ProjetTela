import 'package:flutter/material.dart';
import 'package:mobile/models/place.dart';
import 'package:mobile/ui/views/immo/maisonVisite/maisonVisiteViewModel.dart';
import 'package:mobile/ui/widget/place_card.dart';
import 'package:stacked/stacked.dart';

class MaisonVisite extends StatefulWidget {
  const MaisonVisite({
    super.key,
  });

  /// this list should come from a call done in the model remmove  it when implemented

  @override
  State<MaisonVisite> createState() => _MaisonVisiteState();
}

class _MaisonVisiteState extends State<MaisonVisite> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<MaisonVisiteViewModel>.reactive(
      viewModelBuilder: () => MaisonVisiteViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Visitées', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          leading: InkWell(
            onTap: () => model.navigateToProfile(),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          elevation: 5,
        ),
        backgroundColor: Colors.white,
        body: FutureBuilder<List<TelaPlace>>(
            future: model.getMyPlaces,
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
                  return snapshot.data!.isNotEmpty
                      ? ListView(
                          scrollDirection: Axis.vertical,
                          children: snapshot.data!
                              .map((e) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                        onTap: () =>
                                            model.navigateToMyVisite(e),
                                        child: PlaceCard(
                                            place: e,
                                            image: (e.images.first) ?? '')),
                                  ))
                              .toList(),
                        )
                      : const Center(
                          child: Text('Pas de maison Visitées avec ce pass'),
                        );
                case ConnectionState.done:
                  return snapshot.data!.isNotEmpty
                      ? ListView(
                          scrollDirection: Axis.vertical,
                          children: snapshot.data!
                              .map((e) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                        onTap: () =>
                                            model.navigateToMyVisite(e),
                                        child: PlaceCard(
                                            place: e,
                                            image: (e.images.first) ?? '')),
                                  ))
                              .toList(),
                        )
                      : const Center(
                          child: Text('Pas de maison Visitées avec ce pass'),
                        );
              }
            }),
      ),
    );
  }
}
