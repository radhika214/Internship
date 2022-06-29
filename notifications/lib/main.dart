import 'package:flutter/material.dart';
import 'package:notifications/screen/home.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: home(),
  ));
}
