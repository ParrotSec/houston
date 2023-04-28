import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:houston/models/category.dart';

class DataService {
  Future<List<Category>> loadData() async {
    final response = await rootBundle.loadString('assets/data.json');
    final List<dynamic> jsonList = json.decode(response);
    return jsonList.map((json) => Category.fromJson(json)).toList();
  }
}
