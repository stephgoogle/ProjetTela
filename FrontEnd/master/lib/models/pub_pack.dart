class PubPack{
  int id ;
  String name;
  String chooseTarif;
  List<Map<String,dynamic>> tarif;
  String particularite;
  String visibilite;
  List<String> avantages;

  PubPack({
    required this.id,
    required this.name,
    required this.chooseTarif,
    required this.tarif,
    required this.particularite,
    required this.visibilite,
    required this.avantages,
  });

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['chooseTarif'] = chooseTarif;
    data['tarif'] = tarif;
    data['particularite'] = particularite;
    data['visibilite'] = visibilite;
    data['avantages'] = avantages;
    return data;
  }

}

class PackSouscription{
  int id;
  String name;
  String company;
  String cardNumber;
  String commercial;
  PubPack? pack;


  PackSouscription({
    required this.id,
    required this.name,
    required this.company,
    required this.cardNumber,
    required this.commercial,
    required this.pack,
    
  });

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['company'] = company;
    data['cardNumber'] = cardNumber;
    data['commercial'] = commercial;
    data['pack'] = pack;
   
    return data;
  }

}


class PackItem{
  String name;
  String tarif;


  PackItem({
    required this.name,
    required this.tarif,
    
  });

}