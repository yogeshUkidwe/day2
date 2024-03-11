import 'package:day2/screen/loginScreen.dart';
import 'package:flutter/material.dart';

import 'compnents/google_pay_home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
