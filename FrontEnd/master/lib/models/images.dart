class TelaImage {
  int id = 0;
  int placeId = 0;
  String link = '';

  TelaImage({required this.id, required this.placeId, required this.link});

  static TelaImage fromJson(Map<String, dynamic> json) {
    TelaImage u = TelaImage(
      id: json["id"],
      placeId: json["place_id"],
      link: json["link"],
    );
    return u;
  }

  // map for database
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "link": link,
      "place_id": placeId,
    };
  }

  @override
  String toString() {
    return 'TelaImage{id: $id, immoID: $placeId, link: $link}';
  }
}
