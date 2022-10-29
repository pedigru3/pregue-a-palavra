// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddressModel {
  String cep;
  String logradouro;
  String houseNumber;
  String bairro;
  String localidade;
  String uf;
  String? complement;

  AddressModel({
    required this.cep,
    required this.logradouro,
    required this.houseNumber,
    required this.bairro,
    required this.localidade,
    required this.uf,
    this.complement,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cep': cep,
      'logradouro': logradouro,
      'houseNumber': houseNumber,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'complement': complement,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      cep: map['cep'] as String,
      logradouro: map['logradouro'] as String,
      houseNumber: map['houseNumber'] ?? '',
      bairro: map['bairro'] as String,
      localidade: map['localidade'] as String,
      uf: map['uf'] as String,
      complement:
          map['complement'] != null ? map['complement'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
