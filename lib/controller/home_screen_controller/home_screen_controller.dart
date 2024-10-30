import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  List productCategory = [];

  // api feching product Category

  Future<void> getCategory() async {
    final categoryUrl =
        Uri.parse('https://fakestoreapi.com/products/categories/');

    try {
      var categoryRespose = await http.get(categoryUrl);

      if (categoryRespose.statusCode == 200) {
        productCategory = jsonDecode(categoryRespose.body);
      }
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  // UI logicall designs

  int selectedCategoryIndex = 0; // Default selected index
  int selectedProductIndex = 0; // Default selected index for products

// tap function for categoryies

  void categoryTapFunction(int selectedCategoryIndex) {
    selectedCategoryIndex;
    notifyListeners();
  }
// tap function for categoryies

  void productTapFunction(int selectedProductIndex) {
    selectedProductIndex;
    notifyListeners();
  }
}
