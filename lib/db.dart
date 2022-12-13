// ignore_for_file: unused_import, depend_on_referenced_packages

import 'dart:convert';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Counter {
  int value = 0;

  void increment() => value++;

  void decrement() => value--;
}
