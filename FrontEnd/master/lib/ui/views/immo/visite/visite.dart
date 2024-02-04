import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/models/place.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/ui/views/immo/visite/visiteViewModel.dart';
import 'package:stacked/stacked.dart';

class Visite extends StatefulWidget {
  const Visite({super.key, required this.place});
  final TelaPlace place;

  @override
  State<Visite> createState() => _VisiteState();
}

class _VisiteState extends State<Visite> {
  // List<String> imgs = [
  //   'assets/images/p1.webp',
  //   'assets/images/p2.webp',
  //   'assets/images/p3.webp',
  //   'assets/images/p4.webp',
  //   'assets/images/p5.webp',
  // ];

  static const String _BASE_URL = "http://office.telaci.com/public/";
  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    return ViewModelBuilder<VisiteViewModel>.reactive(
      viewModelBuilder: () => VisiteViewModel(),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Visites', style: TextStyle(color: Colors.white)),
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
          body: Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                      '${widget.place.isBureau ? 'Bureau' : 'Logement'} à louer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 32,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    width: mq.size.width,
                    height: mq.size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.place.images.length,
                      itemBuilder: (BuildContext context, int index) => InkWell(
                        onTap: () => model.navigateToImageNav(
                            widget.place.images, index),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            '$_BASE_URL${widget.place.images[index]}',
                            loadingBuilder: (_, Widget child,
                                    ImageChunkEvent? loadingProgress) =>
                                (loadingProgress == null)
                                    ? child
                                    : Container(
                                        padding: const EdgeInsets.all(8),
                                        child: const Center(
                                            child:
                                                CircularProgressIndicator())),
                            errorBuilder: (_, obj, er) => Image.asset(
                              'assets/images/logo.png',
                              width: 50,
                              fit: BoxFit.fitWidth,
                            ),
                            width: mq.size.width - 80,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8),
                    child: Text(
                        'Loyer : ${NumberFormat.currency(locale: 'fr_FR', name: 'F CFA', decimalDigits: 0).format(widget.place.price)}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 28,
                            fontWeight: FontWeight.w600)),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Démarcheur',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipOval(
                          child: SizedBox(
                            width: 60,
                            height: 60,
                            child: Image.network(
                              '$_BASE_URL${widget.place.demarcheur!.photo}',
                              loadingBuilder: (_, Widget child,
                                      ImageChunkEvent? loadingProgress) =>
                                  (loadingProgress == null)
                                      ? child
                                      : const Center(
                                          child: CircularProgressIndicator()),
                              errorBuilder: (_, obj, er) => Image.asset(
                                'assets/images/logo.png',
                                width: 50,
                                fit: BoxFit.fitWidth,
                              ),
                              width: 50,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${widget.place.demarcheur?.nom ?? ''} ${widget.place.demarcheur?.prenom ?? ''}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  IconButton(
                                  onPressed: (){
                                    AuthService.sendSMS(widget.place.demarcheur!.phone);
                                    },
                                      icon: const Icon(Icons.sms_rounded, color: Colors.grey, size: 28,),
                                    ),
                                  const Padding(padding: EdgeInsets.only(right: 8, left: 8)),
                                  IconButton(
                                      onPressed: (){
                                        AuthService.callUser(widget.place.demarcheur!.phone);
                                      },
                                      icon: const Icon(Icons.phone_rounded, color: Colors.green, size: 28,),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Commune',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.place.commune!.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Type',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox.shrink(),
                      Visibility(
                        visible: widget.place.isAppartment,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Appartement',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                      Visibility(
                        visible: widget.place.isMaisonBasse,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Maison Basse',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                      Visibility(
                        visible: widget.place.isDuplex,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Duplex',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                      Visibility(
                        visible: widget.place.isStudio,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Résidence',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                      Visibility(
                        visible: widget.place.isChambre,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Résidence',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                      Visibility(
                        visible: widget.place.isResidence,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Résidence',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(' de ${widget.place.nombrePiece} Pièces',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                      ),
                      const SizedBox.shrink(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'avec ${widget.place.nombreSalleEau} Salles d\'eau',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ),
                  Visibility(
                    visible: widget.place.isHautStanding,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Haut standing sans piscine',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Visibility(
                    visible: widget.place.hasPiscine,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Haut standing avec piscine',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Commoditées additionneles',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                  ),
                  const Divider(),
                  Visibility(
                    visible: widget.place.hasGarage,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Garage',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Visibility(
                    visible: widget.place.hasGardien,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Gardien',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Visibility(
                    visible: widget.place.hasCoursAvant,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Cour avant',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Visibility(
                    visible: widget.place.hasCoursArriere,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Cour arrière',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Visibility(
                    visible: widget.place.hasBalconAvant,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Balcon avant',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Visibility(
                    visible: widget.place.hasBalconArriere,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Balcon arrière',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Description',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8),
                    child: Text(widget.place.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
