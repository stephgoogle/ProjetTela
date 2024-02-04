class TelaTransaction {
  int id = 0;
  String type = '';
  String paymentWay = '';
  String transactionNumber = '';
  String operationId = '';
  double amount = 0;
  DateTime date = DateTime.now();

  TelaTransaction(
      {required this.id,
      required this.type,
      required this.paymentWay,
      required this.transactionNumber,
      required this.operationId,
      required this.amount,
      required this.date});

  static TelaTransaction fromJson(Map<String, dynamic> json) {
    TelaTransaction u = TelaTransaction(
      id: json["id"],
      amount: (json["amount"] as int).toDouble(),
      type: json["transaction_type"],
      transactionNumber: json["transaction_number"],
      date: DateTime.parse(json["date_transaction"]),
      paymentWay: json["transaction_way"] ?? '',
      operationId: '',
    );
    return u;
  }

  // map for database
  Map<String, dynamic> toJson() {
    return {
      "amount": amount,
      "date_transaction": date.toIso8601String(),
      "transaction_number": transactionNumber,
      "transaction_way": paymentWay,
      "operation_id": operationId,
      "transaction_type": type,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TelaTransaction &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          type == other.type &&
          paymentWay == other.paymentWay &&
          transactionNumber == other.transactionNumber &&
          amount == other.amount &&
          date == other.date;

  @override
  int get hashCode =>
      id.hashCode ^
      type.hashCode ^
      paymentWay.hashCode ^
      transactionNumber.hashCode ^
      amount.hashCode ^
      date.hashCode;

  @override
  String toString() {
    return 'TelaTransaction{id: $id, type: $type, paymentWay: $paymentWay, TransactionNumber: $transactionNumber, amount: $amount, date: $date}';
  }
}

/// EBANK TRANSAACTIONS
class TelaEBankTransaction {
  int id = 0;
  int transactionId = 0;
  bool isRetrait = false;
  TelaTransaction? transaction;

  DateTime date = DateTime.now();

  TelaEBankTransaction(
      {required this.id,
      required this.transactionId,
      required this.isRetrait,
      this.transaction,
      required this.date});

  static TelaEBankTransaction fromJson(Map<String, dynamic> json) {
    TelaEBankTransaction u = TelaEBankTransaction(
      id: json["id"],
      transactionId: json["transaction_id"],
      transaction: json["transaction"],
      isRetrait: json["is_retrait"] == 1,
      date: DateTime.parse(json["creation_date"]),
    );
    return u;
  }

  // map for database
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "creation_date": date.toIso8601String(),
      "transaction_id": transactionId,
      "is_retrait": isRetrait ? 1 : 0,
    };
  }
}

class TelaEpargneTransaction {
  int id = 0;
  int transactionId = 0;
  bool isRetrait = false;
  TelaTransaction? transaction;

  DateTime date = DateTime.now();

  TelaEpargneTransaction(
      {required this.id,
      required this.transactionId,
      required this.isRetrait,
      this.transaction,
      required this.date});

  static TelaEpargneTransaction fromJson(Map<String, dynamic> json) {
    TelaEpargneTransaction u = TelaEpargneTransaction(
      id: json["id"],
      transactionId: json["transaction_id"],
      transaction: json["transaction"],
      isRetrait: json["is_retrait"] == 1,
      date: DateTime.parse(json["creation_date"]),
    );
    return u;
  }

  // map for database
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "creation_date": date.toIso8601String(),
      "transaction_id": transactionId,
      "is_retrait": isRetrait ? 1 : 0,
    };
  }
}
