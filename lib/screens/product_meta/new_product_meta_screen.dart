import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_login_build/models/product_meta.dart';
import 'package:flutter_login_build/providers/login_token_provider.dart';
import 'package:flutter_login_build/providers/product_meta_provider.dart';
import 'package:flutter_login_build/providers/user_provider.dart';
import 'package:flutter_login_build/screens/product_meta/components/product_meta_form.dart';
import 'package:provider/provider.dart';

class NewProductMetaScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  String? title;
  String? guides;

  @override
  Widget build(BuildContext context) {
    final loginTokenProvider = Provider.of<LoginTokenProvider>(context);
    final productMetaProvider = Provider.of<ProductMetaProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    final token = loginTokenProvider.getToken;

    return Scaffold(
      appBar: AppBar(
        title: Text("New 상품 메타"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          child: ProductMetaForm(
            onChangedTitle: (title) {
              this.title = title;
            },
            onChangedGuides: (guides) {
              this.guides = guides;
            },
            onSaveButton: () => productMetaProvider.create(
              context,
              token: token,
              productMeta: ProductMeta(
                title: this.title!,
                myrealtrip_title: this.title!,
                triple_title: this.title!,
                nolbal_title: this.title!,
                frip_title: this.title!,
                required_time: null,
                guides: [1],
                created: DateTime.now().toString(),
                updated: DateTime.now().toString(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
