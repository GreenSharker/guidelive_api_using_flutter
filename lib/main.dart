import 'package:flutter/material.dart';
import 'package:flutter_login_build/providers/login_token_provider.dart';
import 'package:flutter_login_build/providers/product_meta_provider.dart';
import 'package:flutter_login_build/providers/product_provider.dart';
import 'package:flutter_login_build/providers/user_provider.dart';
import 'package:flutter_login_build/screens/login/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginTokenProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ProductMetaProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginScreen(),
    );
  }
}
