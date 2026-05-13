import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'screens/login.dart';

void main() {
  // Inicializa SQLite FFI para escritorio
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  runApp(MaterialApp(
    home: Login(),
    debugShowCheckedModeBanner: false,
  ));
}
