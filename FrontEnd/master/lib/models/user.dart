/// Démarcheur user
class User {
  /// a class that will hold the user data need the names and the balance first.
  /// the balance is not mandatory*/

  // Variables
  int id = 0;
  static int isStaff = 0;
  String prenom;
  String nom;
  String mail;
  String phone;
  String photo;
  double balance = 0;
  bool isComplete = false;
  bool isSuspended = false;
  bool isValidated = false;
  // String token = '';
  // DateTime tokenDate = DateTime.now();

  // the cash object related to the user will be hold here for the moment
  DateTime creationDate = DateTime.now();

  // Constructor
  User({
    required this.nom,
    required this.prenom,
    required this.photo,
    this.mail = '',
    this.phone = '',
    this.balance = 0,
    this.isValidated = false,
    this.isComplete = false,
    this.isSuspended = false,
  });

  static User fromJson(Map<String, dynamic> json) {
    print('before *********');
    User u = User(
      nom: json["nom"],
      prenom: json["prenoms"],
      mail: json["email"] ?? '',
      phone: json["phone"],
      photo: json["photo_profil"],
      balance: double.parse(json["balance"].toString()),
      isValidated: json["is_validated"] == 1,
      isSuspended: json["is_suspended"] == 1,
      isComplete: json["is_completed"] == 1,
    );
    u.id = json["id"];
    isStaff = json["is_staff"];

    print('before id');
    u.creationDate = DateTime.parse(json["created_at"] ?? '2023-10-10');
    return u;
  }

  static User fromString(Map<String, dynamic> json) {
    User u = User(
      nom: json["nom"],
      prenom: json["prenom"],
      mail: json["mail"] ?? '',
      phone: json["phone"].toString(),
      photo: json["photo"],
      balance: double.parse(json["balance"]),
      isValidated: bool.parse(json["isValidated"]),
      isSuspended: bool.parse(json["isSuspended"]),
      isComplete: bool.parse(json["isStaff"]),
    );
    u.id = int.parse(json["id"]);
    u.creationDate = DateTime.parse(json["creationDate"]);
    return u;
  }

  // map for database
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nom": nom,
      "prenom": prenom,
      "mail": mail,
      "phone": phone,
      "photo": photo,
      "balance": balance,
      "creationDate": creationDate,
      "isSuspended": isSuspended ? 1 : 0,
      "is_validated": isValidated ? 1 : 0,
      "isStaff": isComplete ? 1 : 0,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, prenom: $prenom, nom: $nom, mail: $mail, phone: $phone, balance: $balance, isStaff: $isComplete, isSuspended: $isSuspended, isValidated: $isValidated, creationDate: $creationDate}';
  }
}

/// identity profiil
class UserIdentity {
  /// a class that will hold the user data need the names and the balance first.
  /// the balance is not mandatory*/

  // Variables
  int id = 0;
  int userId;
  String name;
  String birthPlace;
  String nationality;
  String pays;
  String domicile;
  String phone;
  String phone2;
  String photo;
  String docRecto;
  String docVerso;
  String docNumber;
  String genre;
  bool isSuspended = false;
  bool isValidated = false;
  // String token = '';
  // DateTime tokenDate = DateTime.now();

  // the cash object related to the user will be hold here for the moment
  DateTime birthDay = DateTime.now();

  UserIdentity({
    required this.userId,
    required this.name,
    required this.birthPlace,
    required this.nationality,
    required this.pays,
    required this.domicile,
    required this.phone,
    required this.phone2,
    required this.photo,
    required this.docRecto,
    required this.docVerso,
    required this.docNumber,
    required this.birthDay,
    required this.genre,
    this.isSuspended = false,
    this.isValidated = false,
  }); // Constructor

  static UserIdentity fromJson(Map<String, dynamic> json) {
    UserIdentity u = UserIdentity(
      userId: json["user_id"],
      name: json["name"],
      phone: json["phone1"],
      phone2: 'phone2',
      genre: json["genre"],
      photo: json["photo"],
      docRecto: json["cni_recto"],
      docVerso: json["cni_verso"],
      docNumber: json["cni_number"] ?? '',
      nationality: json["nationalite"],
      pays: json["pays"],
      domicile: json["domicile"],
      birthPlace: json["lieu_naissance"],
      birthDay: DateTime.parse(json["date_naissance"]),
      isValidated: json["is_validated"] == 1,
      isSuspended: json["is_suspended"] == 1,
    );
    u.id = json["id"];
    return u;
  }

  // map for database
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "user_id": userId,
      "photo": photo,
      "cni_recto": docRecto,
      "cni_verso": docVerso,
      "cni_number": docNumber,
      "genre": genre,
      "phone1": phone,
      "phone2": phone2,
      "nationalite": nationality,
      "pays": pays,
      "domicile": domicile,
      "lieu_naissance": birthPlace,
      "date_naissance": birthDay,
      "isSuspended": isSuspended ? 1 : 0,
      "is_validated": isValidated ? 1 : 0,
    };
  }

  static UserIdentity fromString(Map<String, dynamic> json) {
    UserIdentity u = UserIdentity(
      userId: json["userId"],
      name: json["name"],
      phone: json["phone"],
      phone2: 'phone2',
      genre: json["genre"],
      photo: 'photo',
      docRecto: json["docRecto"],
      docVerso: json["docVerso"],
      docNumber: json["docNumber"] ?? '',
      nationality: json["nationality"],
      pays: json["pays"],
      domicile: json["domicile"],
      birthPlace: json["birthPlace"],
      birthDay: DateTime.parse(json["birthDay"]),
      isValidated: json["isValidated"] == 1,
      isSuspended: json["isSuspended"] == 1,
    );
    u.id = int.parse(json["id"]);
    return u;
  }

  @override
  String toString() {
    return 'id: $id, userId: $userId, name: $name, birthPlace: $birthPlace, nationality: $nationality, pays: $pays, domicile: $domicile, phone: $phone, phone2: $phone2, photo: $photo, docRecto: $docRecto, docVerso: $docVerso, docNumber: $docNumber, genre: $genre, isSuspended: $isSuspended, isValidated: $isValidated, birthDay: $birthDay';
  }
}
