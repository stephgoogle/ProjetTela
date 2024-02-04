import 'dart:developer';

import 'package:mobile/app/app.locator.dart';
import 'package:mobile/models/pub_pack.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PubliciteViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  int id = 0;
  String name = '';
  String companyName = '';
  String cardNumber = '';
  String commercial = '';
  PubPack? choosePack;
  bool consentant = false;

 
  List<PubPack>? packs = [
      PubPack(
       id: 1,
      name: 'prestige',
      chooseTarif: "150000",
      tarif:[ 
        {
          "value":"150000",
          "text":"150000 FCFA(captures d'images effectuées par BSPRO)"
        },
        {
          "value":"100000",
          "text":"100000 FCFA(le client prospose ses propres images)"
        },
      ],
      particularite: "Prises de vue effectuées par l'Entreprise",
      visibilite: "1 semaine",
      avantages: [
        "1- presence sur la page d'accueil (image figées) ",
        "2- Vous êtes presenté comme sponsor officiel d'une emission live ",
       "3- 01 passage publicitaire au cours de chacune des émissions LIVE ",
       "4- passage en continu  pendant 01 semaine sur le canal Publicité",
       "5- presence sur l interface TELA Finance de tous les abonnés",
      "6- 01 passage au cours de chaque émission en differé",
       "7- 01 passage au cours de chaque émission rediffusée"
      ]
    ),

   

      PubPack(
       id: 2,
      name: 'premium',
      chooseTarif: "100000",
      tarif:[ 
        {
          "value":"100000",
          "text":"100000 FCFA(captures d'images effectuées par BSPRO)"
        },
        {
          "value":"75000",
          "text":" 75000 FCFA(le client prospose ses propres images)"
        },
      ],
      particularite: "Prises de vue effectuées par l'Entreprise",
      visibilite: "1 semaine",
      avantages: [
        "1- presence sur la page Maison à louer (image) ",
        "2- vous êtes désigné comme présentateur officiel d'une émission Live "
        "3- 01 passage publicitaire au cours de chacune des émissions LIVE ",
        "4- passage en continu  pendant 01 semaine sur le canal Publicité",
         "5- 01 passage au cours de chaque émission en differé",
       
      ]
    ),

     PubPack(
      id: 3,
      name: 'medium',
      chooseTarif: "75000",
      tarif:[ 
        {
          "value":"75000",
          "text":"75000 FCFA(captures d'images effectuées par BSPRO)"
        },
        {
          "value":"50000",
          "text":"50000 FCFA(le client prospose ses propres images)"
        },
      ],
      particularite: "Prises de vue effectuées par le commercial",
      visibilite: "5 jours",
      avantages: [
         "1- presence sur la page de Profile(image)"
        "2- 01 passage publicitaire au cours de chacune des émissions rédiffusées ",
        "3- Passage en continu pendant 01 semaine sur le canal Publicité",
        "4- 01 passage au cours de chaque émission en differé",
      ]
    ),

    PubPack(
      id:4,
      name: 'basic',
      chooseTarif: "50000",
      tarif:[ 
        {
          "value":"50000",
          "text":"50000 FCFA(captures d'images effectuées par BSPRO)"
        },
        {
          "value":"35000",
          "text":"35000 FCFA(le client prospose ses propres images)"
        },
      ],
      particularite: "Prises de vue effectuées par le commercial",
      visibilite: "5 jours",
      avantages: [
        "1- 01 passage publicitaire au cours des films et clips musicaux",
        "2- Passage en continue pendant 01 semaine sur le canal Publicité",
        "3- 01 passage au cours de chaque émission en differé",
      ]
    ),
  ];


  PubliciteViewModel() {
    log("PubliciteViewModel");
    // getPhone();
    _authService.getAbonnementSaved();
    print('***** Phone $name ****');
  }

  PackSouscription? souscription;

  Future souscribe() async {
    log("souscribe");
    souscription = PackSouscription(
        id: id,
      name: name,
      company: companyName,
      cardNumber: cardNumber,
      commercial: commercial,
      pack: choosePack,
    );
   
    
    
  }


}
