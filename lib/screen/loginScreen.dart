import 'package:day2/model/userModel.dart';
import 'package:flutter/material.dart';

import '../compnents/google_pay_home.dart';
import '../compnents/login_component/buttonCard.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late UserModel sourceChat;
  List<UserModel> userList = dummyData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: dummyData.length,
          itemBuilder: (context, index) => InkWell(
              onTap: () {
                sourceChat = userList.removeAt(index);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (builder) =>
                            GooglePayHome(userList, sourceChat)));
              },
              child: ButtonCard(
                  Icons.person, dummyData[index].name, dummyData[index]))),
    );
  }
}
