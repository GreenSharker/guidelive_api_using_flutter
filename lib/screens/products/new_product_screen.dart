import 'package:flutter/material.dart';

class NewProductScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New 여행 패키지"),
      ),
      body: Center(
        child: Text("새 여행 패키지 스크린"),
      ),
    );
  }
}
