import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_login_build/models/product.dart';
import 'package:flutter_login_build/providers/login_token_provider.dart';
import 'package:flutter_login_build/providers/product_provider.dart';
import 'package:flutter_login_build/screens/products/new_product_screen.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> _products = <Product>[];

  @override
  Widget build(BuildContext context) {
    final loginTokenProvider = Provider.of<LoginTokenProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    final token = loginTokenProvider.getToken;
    _products = productProvider.getProducts(token);

    return Scaffold(
      appBar: AppBar(
        title: Text("여행 패키지 목록"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewProductScreen()));
            },
            icon: Icon(Icons.add_box),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[0];
          return Card(
            child: ListTile(
              leading: Text(product.id.toString()),
            ),
          );
        },
      ),
    );
  }
}
