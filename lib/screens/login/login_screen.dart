import 'package:flutter/material.dart';
import 'package:flutter_login_build/providers/login_token_provider.dart';
import 'package:flutter_login_build/screens/product_meta/product_meta_screen.dart';
import 'package:flutter_login_build/screens/products/products_screen.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/gl-betalogo22.png", width: MediaQuery.of(context).size.width * 0.5),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailCtrl,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "이메일 주소가 비었습니다.";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "이메일 주소",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordCtrl,
                    decoration: InputDecoration(
                      labelText: "비밀번호",
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      onPressed: login,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        child: Text(
                          "로그인",
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> login() async {
    final isValid = _formKey.currentState!.validate(); // 입력폼 검증
    final loginTokenProvider = Provider.of<LoginTokenProvider>(context, listen: false);

    if (!isValid) {
      return;
    }

    print("계정 체크:");
    print("이메일: ${emailCtrl.text}");
    print("비밀번호: ${passwordCtrl.text}");

    final url = Uri.parse("http://localhost:3000/auth/login");
    final res = await http.post(url, body: {"email": "${emailCtrl.text}", "password": "${passwordCtrl.text}"});

    print("응답결과 확인!");
    switch (res.statusCode) {
      case 200:
        loginTokenProvider.setToken(res.body);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProductMetaScreen()));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: const Text(
              "성공적으로 로그인되었습니다.",
              textAlign: TextAlign.center,
            ),
          ),
        );
        break;
      default:
        print("에러 발생하였습니다.");
        print("statusCode: ${res.statusCode}");
        print("에러 메시지: ${res.body}");
        break;
    }
  }
}
