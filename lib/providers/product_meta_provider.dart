import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_login_build/config/setting.dart';
import 'package:flutter_login_build/models/product_meta.dart';
import 'package:http/http.dart' as http;

class ProductMetaProvider with ChangeNotifier {
  List<ProductMeta> _productMetas = <ProductMeta>[];

  List<ProductMeta> getProductMetas(token) {
    _getProductMetas(token);
    return _productMetas;
  }

  Future<void> create(BuildContext context, {required token, required ProductMeta productMeta}) async {
    final url = Uri.parse("${Setting.baseUrl}/product-meta");

    final data = {"title": productMeta.title, "guides": productMeta.guides};

    final res = await http.post(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json", HttpHeaders.authorizationHeader: "Bearer $token"},
      body: jsonEncode(data),
    );

    switch (res.statusCode) {
      case 200:
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: const Text("성공적으로 등록되었습니다.")));
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: const Text(
              "등록할 수 없습니다.",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
        break;
    }
  }

  Future _getProductMetas(token) async {
    final url = Uri.parse("${Setting.baseUrl}/product-meta");
    final res = await http.get(url, headers: {HttpHeaders.contentTypeHeader: "application/json", HttpHeaders.authorizationHeader: "Bearer $token"});

    final List<ProductMeta> parsedResponse = jsonDecode(res.body)["data"].map<ProductMeta>((json) => ProductMeta.fromJson(json)).toList();

    _productMetas.clear();
    _productMetas.addAll(parsedResponse);

    notifyListeners();
  }
}
