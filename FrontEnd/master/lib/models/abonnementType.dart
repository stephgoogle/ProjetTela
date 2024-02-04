class AbonnementType {
  int id = 0;
  String type = '';
  int price = 0;
  String title = '';
  int pourcentage = 0;

  AbonnementType({
    required this.id,
    required this.type,
    required this.price,
    required this.pourcentage,
    required this.title,
  });

  static AbonnementType fromJson(Map<String, dynamic> json) {
    AbonnementType u = AbonnementType(
      id: json["id"],
      type: json["type"],
      pourcentage: json["pourcentage_demarcheur"],
      price: int.parse(json["price"]),
      title: json["title"],
    );
    return u;
  }

  static AbonnementType fromString(Map<String, dynamic> json) {
    AbonnementType u = AbonnementType(
      id: int.parse(json["id"]),
      type: json["type"],
      pourcentage: json["pourcentage"],
      price: int.parse(json["price"]),
      title: json["title"],
    );
    return u;
  }

  // map for database
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "type": type,
      "price": price,
      "pourcentage_demarcheur": price,
      "title": title,
    };
  } // map for database

  Map<String, dynamic> toJson2() {
    return {
      "type_abonnement_id": id,
      "type": type,
      "price": price,
      "title": title,
    };
  }

  @override
  String toString() {
    return 'AbonnementType{id: $id, type: $type, price: $price, title: $title, pourcentage: $pourcentage}';
  }
}

class PassType {
  int id = 0;
  String name = '';
  bool isVisite = false;
  int numberOfVisites = 0;
  String price = '';

  PassType({
    required this.id,
    required this.price,
    required this.name,
    required this.isVisite,
    required this.numberOfVisites,
  });

  static PassType fromJson(Map<String, dynamic> json) {
    PassType u = PassType(
      id: json["id"],
      name: json["name"],
      price: json["price"],
      numberOfVisites: json["nb_visite"],
      isVisite: json["is_visite"] == 1,
    );
    return u;
  }

  static PassType fromString(Map<String, dynamic> json) {
    PassType u = PassType(
      id: int.parse(json["id"]),
      name: json["name"],
      price: (json["price"]),
      numberOfVisites: int.parse(json["numberOfVisites"]),
      isVisite: bool.parse(json["isVisite"]),
    );
    return u;
  }

  // map for database
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "nb_visite": numberOfVisites,
      "price": price,
      "is_visite": isVisite ? 1 : 0,
    };
  }

  Map<String, dynamic> toJson2() {
    return {
      "pass_type_id": id,
      "name": name,
      "nb_visite": numberOfVisites,
      "price": price,
      "is_visite": isVisite ? 1 : 0,
    };
  }

  @override
  String toString() {
    return 'PassType{id: $id, name: $name, isVisite: $isVisite, numberOfVisites: $numberOfVisites, price: $price}';
  }
}
