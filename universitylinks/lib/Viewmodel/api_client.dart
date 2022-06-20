import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/university.dart';

List<University> parseUniversity(List<dynamic> responseBody) {
  print(responseBody.runtimeType);
  //List<dynamic> list = json.decode(responseBody) as List<dynamic>;
  final List<University> universities =
      responseBody.map((model) => University.fromJson(model)).toList();
  //print("$universities");
  return universities;
}

Future<List<University>> fetchUniversity(String dropdownvalue) async {
  Dio _dio = Dio();
  final URL = "http://universities.hipolabs.com/search?country=$dropdownvalue";
  final response = await _dio.get(URL);
  if (response.statusCode == 200) {
    return parseUniversity(response.data);
  } else {
    throw Exception("Can't get Universities");
  }
}
