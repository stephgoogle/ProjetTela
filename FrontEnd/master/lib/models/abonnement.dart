import 'package:intl/intl.dart';
import 'package:mobile/models/abonnementType.dart';

class Abonnement {
  int id = 0;
  String type = '';
  AbonnementType? abonnementType;
  int userId = 0;
  int abonnementTypeID = 0;
  int transactionId = 0;
  DateTime start;
  DateTime end;

  Abonnement(
      {required this.id,
      required this.type,
      required this.userId,
      required this.transactionId,
      required this.abonnementType,
      required this.abonnementTypeID,
      required this.start,
      required this.end});

  static Abonnement fromJson(Map<String, dynamic> json) {
    Abonnement u = Abonnement(
      id: json["id"],
      type: json["type"],
      start: DateTime.parse(json["start_date"]),
      end: DateTime.parse(json["end_date"]),
      userId: json["user_id"] ?? 0,
      transactionId: json["transaction_id"],
      abonnementTypeID: json["type_abonnement_id"],
      abonnementType: null,
      // abonnementType: json["type_abonnement"] != null? AbonnementType.fromJson(json["type_abonnement"]) : null,
    );
    return u;
  }

  // map for database
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "start_date": start.toIso8601String(),
      "end_date": end.toIso8601String(),
      "user_id": userId,
      "transaction_id": transactionId,
      "type_abonnement_id": abonnementTypeID,
    };
  }

  String startSTR() {
    return DateFormat.yMMMd().format(start);
  }

  String endSTR() {
    return DateFormat.yMMMd().format(end);
  }

  static Abonnement fromString(Map<String, dynamic> json) {
    Abonnement u = Abonnement(
      id: int.parse(json["id"]),
      type: json["type"],
      start: DateTime.parse(json["start"]),
      end: DateTime.parse(json["end"]),
      userId: int.parse(json["userId"]),
      transactionId: int.parse(json["transactionId"]),
      abonnementTypeID: int.parse(json["abonnementTypeID"]),
      abonnementType: null,
    );
    return u;
  }

  @override
  String toString() {
    return 'id: $id, type: $type, userId: $userId, abonnementTypeID: $abonnementTypeID, transactionId: $transactionId, start: $start, end: $end';
  }
}

class PassVisite {
  int id = 0;
  String transactionNumber = '';
  String code = '';
  PassType? passType;
  int numberOfVisites = 0;
  int passTypeID = 0;
  int transactionId = 0;
  DateTime start;
  DateTime end;
  bool isConfirm = false;
  bool isExpired = false;

  PassVisite(
      {required this.id,
      required this.transactionNumber,
      required this.code,
      this.passType,
      required this.numberOfVisites,
      required this.passTypeID,
      required this.transactionId,
      required this.start,
      required this.isConfirm,
      required this.isExpired,
      required this.end});

  static PassVisite fromJson(Map<String, dynamic> json) {
    PassVisite u = PassVisite(
      id: json["id"],
      start: DateTime.parse(json["created_at"]),
      end: DateTime.parse(json["end_date"]),
      transactionId: json["transaction_id"],
      passTypeID: json["pass_type_id"],
      passType: null,
      transactionNumber: json["transaction_number"],
      code: json["code"],
      numberOfVisites: json["nb_visite"],
      isConfirm: json["is_confirmed"] == 1,
      isExpired: json["is_expired"] == 1,
    );
    return u;
  }

  // map for database
  Map<String, dynamic> toJson() {
    return {
      "created_at": start.toIso8601String(),
      "end_date": end.toIso8601String(),
      "transaction_id": transactionId,
      "pass_type_id": passTypeID,
      "transaction_number": transactionNumber,
      "code": code,
      "nb_visite": numberOfVisites,
      "is_confirmed": isConfirm ? 1 : 0,
      "is_expired": isExpired ? 1 : 0,
    };
  }

  static PassVisite fromString(Map<String, dynamic> json) {
    PassVisite u = PassVisite(
      id: int.parse(json["id"]),
      start: DateTime.parse(json["start"]),
      end: DateTime.parse(json["end"]),
      transactionId: int.parse(json["transactionId"]),
      passTypeID: int.parse(json["passTypeID"]),
      transactionNumber: json["transactionNumber"],
      code: json["code"],
      numberOfVisites: int.parse(json["numberOfVisites"]),
      isConfirm: bool.parse(json["isConfirm"]),
      isExpired: bool.parse(json["isExpired"]),
    );
    return u;
  }

  @override
  String toString() {
    return 'id: $id, transactionNumber: $transactionNumber, code: $code, numberOfVisites: $numberOfVisites, passTypeID: $passTypeID, transactionId: $transactionId, start: $start, end: $end, isConfirm: $isConfirm, isExpired: $isExpired';
  }

  String startSTR() {
    return DateFormat.yMMMd().format(start);
  }

  String endSTR() {
    return DateFormat.yMMMd().format(end);
  }
}

class PassTV {
  int id = 0;
  String transactionNumber = '';
  String code = '';
  PassType? passType;
  int programID = 0;
  int passTypeID = 0;
  int transactionId = 0;
  DateTime start;
  DateTime end;
  bool isConfirm = false;
  bool isExpired = false;

  PassTV(
      {required this.id,
      required this.transactionNumber,
      required this.code,
      this.passType,
      required this.programID,
      required this.passTypeID,
      required this.transactionId,
      required this.start,
      required this.isConfirm,
      required this.isExpired,
      required this.end});

  static PassTV fromJson(Map<String, dynamic> json) {
    PassTV u = PassTV(
      id: json["id"],
      start: DateTime.parse(json["created_at"]),
      end: DateTime.parse(json["end_date"]),
      transactionId: json["transaction_id"],
      passTypeID: json["pass_type_id"],
      passType: PassType.fromJson(json["pass_type"]),
      transactionNumber: json["transaction_number"],
      code: json["code"],
      programID: json["programme_tv_id"],
      isConfirm: json["is_confirmed"] == 1,
      isExpired: json["is_expired"] == 1,
    );
    return u;
  }

  // map for database
  Map<String, dynamic> toJson() {
    return {
      "created_at": start.toIso8601String(),
      "end_date": end.toIso8601String(),
      "transaction_id": transactionId,
      "pass_type_id": passTypeID,
      "transaction_number": transactionNumber,
      "code": code,
      "programme_tv_id": programID,
      "is_confirmed": isConfirm ? 1 : 0,
      "is_expired": isExpired ? 1 : 0,
    };
  }

  String startSTR() {
    return DateFormat.yMMMd('fr').format(start);
  }

  String endSTR() {
    return DateFormat.yMMMd('fr').format(end);
  }
}
