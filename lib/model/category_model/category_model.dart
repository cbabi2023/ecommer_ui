// To parse this JSON data, do
//
//     final categoryDataModel = categoryDataModelFromJson(jsonString);

import 'dart:convert';

List<String> categoryDataModelFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String categoryDataModelToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
