import 'dart:convert';

class WalletCard {
  String cardSerial;
  String owner;
  String expireDate;
  WalletCard({
    required this.cardSerial,
    required this.owner,
    required this.expireDate,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'cardSerial': cardSerial});
    result.addAll({'owner': owner});
    result.addAll({'expireDate': expireDate});
  
    return result;
  }

  factory WalletCard.fromMap(Map<String, dynamic> map) {
    return WalletCard(
      cardSerial: map['cardSerial']?.toInt() ?? 0,
      owner: map['owner'] ?? '',
      expireDate: map['expireDate'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WalletCard.fromJson(String source) => WalletCard.fromMap(json.decode(source));

  @override
  String toString() => 'WalletCard(cardSerial: $cardSerial, owner: $owner, expireDate: $expireDate)';
}
