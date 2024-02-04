class TelaProgrammeTV {
  int id = 0;
  String type = '';
  String link = '';
  String description = '';
  bool webview = false;
  bool facebook = false;
  DateTime dateTournage = DateTime.now();
  DateTime dateDiffusion = DateTime.now();

  TelaProgrammeTV(
      {required this.id,
      required this.type,
      required this.link,
      this.webview = false,
      this.facebook = false,
      required this.description,
      required this.dateTournage,
      required this.dateDiffusion});

  static TelaProgrammeTV fromJson(Map<String, dynamic> json) {
    TelaProgrammeTV u = TelaProgrammeTV(
      id: json["id"],
      type: json["type"],
      link: json["link"],
      description: json["description"],
      dateTournage: DateTime.parse(json["date_tournage"]),
      dateDiffusion: DateTime.parse(json["date_diffusion"]),
    );
    return u;
  }

  // map for database
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "type": type,
      "link": link,
      "description": description,
      "date_tournage": dateTournage.toIso8601String(),
      "date_diffusion": dateDiffusion.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'TelaProgrammeTV{id: $id, type: $type, link: $link, description: $description, dateTournage: $dateTournage, dateDiffusion: $dateDiffusion}';
  }
}
