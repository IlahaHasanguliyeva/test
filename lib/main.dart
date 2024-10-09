import 'package:flutter/material.dart';
import 'package:project/model/product_model.dart';
import 'package:project/project.dart';
import 'package:project/services/fav_list.dart';
import 'package:project/services/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
    ChangeNotifierProvider<FavListProvider>(create: (_) => FavListProvider()),
    ChangeNotifierProvider<ProductProvider>(create: (_) => ProductProvider()),
    ],
      child: const Project(),
    ),
    );
    
}
