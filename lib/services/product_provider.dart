import 'package:flutter/material.dart';
import 'package:project/model/product_model.dart';
import 'package:project/services/product_api.dart';

class ProductProvider extends ChangeNotifier {
  final posts = <Product>[];
  bool loading = false;

  getProductsData() async {
    loading = true;

    // notifyListeners();

    final data = await getData();
    posts.addAll(data);
    loading = false;

    notifyListeners();
  }
}
