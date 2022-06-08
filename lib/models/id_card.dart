// To parse this JSON data, do
//
//     final idCard = idCardFromMap(jsonString);

import 'dart:convert';

IdCard idCardFromMap(String str) => IdCard.fromMap(json.decode(str));

String idCardToMap(IdCard data) => json.encode(data.toMap());

class IdCard {
  IdCard({
    this.documentType,
    this.country,
    this.surNames,
    this.givenNames,
    this.documentNumber,
    this.nationalityCode,
    this.birthdate,
    this.sex,
    this.expiryDate,
    this.personalNumber,
    this.personalNumber2,
  });

  String? documentType;
  String? country;
  String? surNames;
  String? givenNames;
  String? documentNumber;
  String? nationalityCode;
  DateTime? birthdate;
  String? sex;
  DateTime? expiryDate;
  String? personalNumber;
  String? personalNumber2;

  factory IdCard.fromMap(Map<String, dynamic> json) => IdCard(
    documentType: json["document_type"] ?? null,
    country: json["country"] ?? null,
    surNames: json["sur_names"] ?? null,
    givenNames: json["given_names"] ?? null,
    documentNumber: json["document_number"] ?? null,
    nationalityCode: json["nationality_code"] ?? null,
    birthdate: json["birthdate"] ?? null,
    sex: json["sex"] ?? null,
    expiryDate: json["expiry_date"] ?? null,
    personalNumber: json["personal_number"] ?? null,
    personalNumber2: json["personal_number_2"] ?? null,
  );

  Map<String, dynamic> toMap() => {
    "document_type": documentType ?? null,
    "country": country ?? null,
    "sur_names": surNames ?? null,
    "given_names": givenNames ?? null,
    "document_number": documentNumber ?? null,
    "nationality_code": nationalityCode ?? null,
    "birthdate": birthdate == null ? null : birthdate!.toIso8601String(),
    "sex": sex ?? null,
    "expiry_date": expiryDate == null ? null : expiryDate!.toIso8601String(),
    "personal_number": personalNumber ?? null,
    "personal_number_2": personalNumber2 ?? null,
  };
}
