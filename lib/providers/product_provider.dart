import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_login_build/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = <Product>[];

  List<Product> getProducts(token) {
    _getProducts(token);
    return _products;
  }

  Future<void> _getProducts(token) async {
    final url = Uri.parse("http://localhost:3000/products");
    final res = await http.get(url, headers: {HttpHeaders.contentTypeHeader: "application/json", HttpHeaders.authorizationHeader: "Bearer $token"});

    _products.clear();
    _products.addAll(jsonDecode(res.body)["data"]);

    notifyListeners();
  }
}
