import 'package:flutter/material.dart';
import 'package:mobile/models/place.dart';
import 'package:mobile/ui/views/immo/catalogue/catalogueViewModel.dart';
import 'package:mobile/ui/widget/place_card.dart';
import 'package:stacked/stacked.dart';

class Catalogue extends StatefulWidget {
  const Catalogue({
    super.key,
  });

  /// this list should come from a call done in the model remmove  it when implemented

  @override
  State<Catalogue> createState() => _CatalogueState();
}

class _CatalogueState extends State<Catalogue> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<CatalogueViewModel>.reactive(
      viewModelBuilder: () => CatalogueViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Mon catalogue',
              style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          leading: InkWell(
            onTap: () => model.navigateToProfile(),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () => model.navigateToNewplace(),
                  child: const Icon(
                    Icons.add_outlined,
                    size: 32,
                    color: Colors.white,
                  )),
            )
          ],
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
                                            place: e, image: e.images[0])),
                                  ))
                              .toList(),
                        )
                      : const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Pas de maisons dans votres catalogue pour le momnent',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
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
                                            place: e, image: e.images[0])),
                                  ))
                              .toList(),
                        )
                      : const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Pas de maisons dans votres catalogue pour le momnent',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        );
              }
            }),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1),
          child: ElevatedButton(
            onPressed: () => model.navigateToNewplace(),
            style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                backgroundColor: Theme.of(context).colorScheme.primary,
                fixedSize: Size(mediaQuery.size.width - 8, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0),
              child: Text(
                'Ajouter',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
