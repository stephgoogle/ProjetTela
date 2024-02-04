class Commune {
  int id = 0;
  String name = '';
  String city = '';

  Commune({required this.id, required this.name, required this.city});

  static Commune fromJson(Map<String, dynamic> json) {
    Commune u = Commune(
      id: json["id"],
      name: json["name"],
      city: json["city"] ?? 'Abidjan',
    );
    return u;
  }

  static Commune fromString(Map<String, dynamic> json) {
    Commune u = Commune(
      id: int.parse(json["id"]),
      name: json["name"],
      city: json["city"] ?? 'Abidjan',
    );
    return u;
  }

  // map for database
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "city": city,
    };
  }

  @override
  String toString() {
    return 'id: $id, name: $name, city: $city';
  }
}
