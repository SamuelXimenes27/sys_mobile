// ignore: depend_on_referenced_packages
import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/person_model.dart';

class DB {
  static final DB instance = DB._init();
  static Database? _database;
  DB._init();

  get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase('sysmobyle.db');
    return _database!;
  }

  Future<Database> _initDatabase(String filePath) async {
    final path = join(await getDatabasesPath(), filePath);
    // FOR CLEAR THE DATABASE
    // await deleteDatabase(path);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int versao) async {
    await db.execute('''
      CREATE TABLE person (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        typeDoc TEXT,
        numberDoc TEXT,
        name TEXT,
        motherName TEXT,
        birthday TEXT
      );
      ''');
  }

  newPerson(Person newPerson) async {
    final db = await database;
    var res = await db.rawInsert(
        "INSERT INTO person(id,typeDoc, numberDoc, name, motherName, birthday) VALUES(${newPerson.id}, '${newPerson.typeDoc.toString()}' , '${newPerson.numberDoc.toString()}', '${newPerson.name.toString()}', '${newPerson.motherName.toString()}', '${newPerson.birthday.toString()}')");
    return res;
  }

  getPerson(int id) async {
    final db = await database;
    var res = await db.query("person", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Person.fromMap(res.first) : Null;
  }

  getAllPersons() async {
    final db = await database;
    var res = await db.rawQuery('SELECT * FROM person');
    log(res.toString());
    return res;
  }

  getCount() async {
    Database db = await database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from person');

    int? resultado = Sqflite.firstIntValue(x);
    return resultado!;
  }

  deleteBase64(int id) async {
    final db = await database;
    db.delete("person", where: "id = ?", whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
