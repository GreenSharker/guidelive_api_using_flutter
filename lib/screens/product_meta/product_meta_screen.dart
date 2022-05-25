import 'package:flutter/material.dart';
import 'package:flutter_login_build/providers/login_token_provider.dart';
import 'package:flutter_login_build/providers/product_meta_provider.dart';
import 'package:flutter_login_build/screens/product_meta/new_product_meta_screen.dart';
import 'package:provider/provider.dart';

class ProductMetaScreen extends StatelessWidget {
  const ProductMetaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginTokenProvider = Provider.of<LoginTokenProvider>(context);
    final productMetaProvider = Provider.of<ProductMetaProvider>(context);

    final token = loginTokenProvider.getToken;
    final metas = productMetaProvider.getProductMetas(token);

    return Scaffold(
      appBar: AppBar(
        title: Text("상품 메타"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewProductMetaScreen()));
              },
              icon: Icon(Icons.add_circle_outline)),
        ],
      ),
      body: ListView.builder(
        itemCount: metas.length,
        itemBuilder: (context, index) {
          final meta = metas[index];
          return Card(
            child: ListTile(
              leading: Text("#${meta.id}"),
              title: Text(meta.title),
            ),
          );
        },
      ),
    );
  }
}
