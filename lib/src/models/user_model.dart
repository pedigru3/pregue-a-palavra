// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pregue_a_palavra/src/models/address_model.dart';

class UserModel {
  String fullname;
  String email;
  String phone;
  String cpf;
  String? password;
  AddressModel? adress;
  String id;
  String token;

  UserModel({
    required this.fullname,
    required this.email,
    required this.phone,
    required this.cpf,
    this.password,
    this.adress,
    required this.id,
    required this.token,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fullname: map['fullname'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      cpf: map['cpf'] as String,
      password: map['password'] != null ? map['password'] as String : null,
      adress: map['adress'] != null
          ? AddressModel.fromMap(map['adress'] as Map<String, dynamic>)
          : null,
      id: map['id'] as String,
      token: map['token'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullname': fullname,
      'email': email,
      'phone': phone,
      'cpf': cpf,
      'password': password,
      'adress': adress?.toMap(),
      'id': id,
      'token': token,
    };
  }

  @override
  String toString() {
    return 'usuário: $fullname';
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
