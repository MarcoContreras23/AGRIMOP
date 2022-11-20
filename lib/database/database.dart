// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:agri_mop/models/Fertilizer.dart';
import 'package:agri_mop/models/Humidity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static final DB instance = DB._init();
  static Database? _database;
  DB._init();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDB('dataBaseAgro.db');
    return _database;
  }

  Future<Database?> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  /*
    Creation of the tables in the data base
    */
  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    await db.execute(
        'CREATE TABLE $tableDataFertilizers (${DataFieldsFertilizers.id} $idType, ${DataFieldsFertilizers.name} $textType , ${DataFieldsFertilizers.value} $textType )');
    await db.execute(
        'CREATE TABLE $tableDataHumidity (${DataFieldsHumidity.id} $idType, ${DataFieldsHumidity.name} $textType , ${DataFieldsHumidity.value} )');
  }

  /*
      *receives as a parameter the information of the data to save 
      *Inserts a record in the database in the fertilizer table.
    */
  Future<Fertilizer> insertData(Fertilizer data) async {
    final db = await database;
    final id = await db?.insert(tableDataFertilizers, data.toJson());
    return data.copy(id: id);
  }

  /*
      *receives as a parameter the information of the data to save 
      *Inserts a record in the database in the humidity table.
    */
  Future<Humidity> insertDataProduct(Humidity data) async {
    final db = await database;
    final id = await db?.insert(tableDataHumidity, data.toJson());
    return data.copy(id: id);
  }

  /*
      *receives as a parameter the id of the data to search for
      *gets a specific data from the database of the table Fertilizer
      *returns a json with the obtained data
    */
  Future<Fertilizer> getDataFertilizier(int id) async {
    final db = await instance.database;
    final maps = await db!.query(
      tableDataFertilizers,
      columns: DataFieldsFertilizers.values,
      where: '${DataFieldsFertilizers.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Fertilizer.fromJson(maps.first);
    } else {
      throw Exception('Data $id not found');
    }
  }

  /*
      *receives as a parameter the id of the data to search for
      *gets a specific data from the database of the table Humidity
      *returns a json with the obtained data
    */
  Future<Humidity> getDataHumidity(int id) async {
    final db = await instance.database;
    final maps = await db!.query(
      tableDataFertilizers,
      columns: DataFieldsHumidity.values,
      where: '${DataFieldsHumidity.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Humidity.fromJson(maps.first);
    } else {
      throw Exception('Data $id not found');
    }
  }

}
