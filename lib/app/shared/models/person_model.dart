import 'dart:convert';

class Person {
  static const String idKey = 'id';
  static const String typeDocKey = 'typeDoc';
  static const String numberDocKey = 'numberDoc';
  static const String nameKey = 'name';
  static const String motherNameKey = 'motherName';
  static const String birthdayKey = 'birthday';

  int? id;
  String? typeDoc;
  String? numberDoc;
  String? name;
  String? motherName;
  String? birthday;

  Person({
    this.id,
    this.typeDoc,
    this.numberDoc,
    this.name,
    this.motherName,
    this.birthday,
  });

  factory Person.fromMap(Map<String, dynamic> json) => Person(
        id: json[idKey],
        typeDoc: json[typeDocKey],
        numberDoc: json[numberDocKey],
        name: json[nameKey],
        motherName: json[motherNameKey],
        birthday: json[birthdayKey],
      );

  Map<String, dynamic> toMap() => {
        idKey: id,
        typeDocKey: typeDoc,
        numberDocKey: numberDoc,
        nameKey: name,
        motherNameKey: motherName,
        birthdayKey: birthday,
      };
}

Person personFromJson(String str) {
  final jsonData = json.decode(str);
  return Person.fromMap(jsonData);
}

String personToJson(Person data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}
