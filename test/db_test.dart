// ignore_for_file: unused_import

import 'package:agri_mop/db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('El contador debe ser incrementado', () {
    final counter = Counter();

    counter.increment();

    expect(counter.value, 1);
  });
}
