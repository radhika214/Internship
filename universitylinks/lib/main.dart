import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/List_of_university.dart';


void main() {
  runApp(ProviderScope(
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
      home: ListOfUniversities(),
    ),
  ));
}
