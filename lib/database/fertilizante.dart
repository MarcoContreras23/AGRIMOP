import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:agri_mop/Models/Fertilizer.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'fertilizers.db'),
        onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE Fertilizers (id INTEGER PRIMARY KEY, nombre TEXT)",
      );
    }, version: 1);
  }

  Future<void> insertFertilizer(Fertilizer fertilizer) async {
    final db = await _openDB();
    await db.insert(
      'dogs',
      fertilizer.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteFertilizer(int id) async {
    final db = await _openDB();
    await db.delete(
      'fertilizers',
      where: "id=?",
      whereArgs: [id],
    );
  }

  Future<void> updateDog(Fertilizer fertilizer) async {
    final db = await _openDB();
    await db.update(
      'dogs',
      fertilizer.toMap(),
      where: 'id = ?',
      whereArgs: [fertilizer.id],
    );
  }

  Future<void> updateFertilizer(Fertilizer fertilizer) async {
    final db = await _openDB();
    await db.update(
      'dogs',
      fertilizer.toMap(),
      where: 'id = ?',
      whereArgs: [fertilizer.id],
    );
  }

  Future<List<Fertilizer>> fertilizer() async {
    final db = await _openDB();
    final List<Map<String, dynamic>> maps = await db.query('fertilizer');

    return List.generate(maps.length, (i) {
      return Fertilizer(
        id: maps[i]['id'],
        name: maps[i]['name'],
      );
    });
  }
}
