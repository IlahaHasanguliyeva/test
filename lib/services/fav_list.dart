import 'package:flutter/material.dart';
import 'package:project/model/product_model.dart';

class FavListProvider extends ChangeNotifier {
  List<Product> favList = [];

  void favAdd(Product item) {
    favList.add(item);
    notifyListeners();
  }

  void favRemove(Product item) {
    favList.remove(item);
    notifyListeners();
  }

  void removeAll() {
    favList.clear();
    notifyListeners();
  }
}
