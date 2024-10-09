import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:project/model/product_model.dart';
import 'package:http/http.dart' as http;

  Future<List<Product>> getData() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      var jsonData = jsonDecode(response.body);
      // final products = <Product>[];
      final products = List<Product>.from(jsonData.map(
        (e) {
          return Product.fromJson(e);
        },
      ));
      // for (var eachProduct in jsonData) {
      //   final product = Product.fromJson(eachProduct);
      //   products.add(product);
      // }
      return products;
      // }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
