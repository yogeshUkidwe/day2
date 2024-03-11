import 'dart:ui';

import 'package:day2/compnents/cash_component/cashUtils.dart';
import 'package:day2/compnents/main_menu_component/menu_tile.dart';
import 'package:day2/compnents/promotion_component/promotion_data.dart';
import 'package:day2/compnents/user_component/user_detail.dart';
import 'package:day2/model/mainMenu.dart';
import 'package:day2/model/userModel.dart';
import 'package:flutter/material.dart';

import 'business_component/business_banner.dart';
import 'business_component/business_details.dart';
import 'business_component/business_header.dart';
import 'business_component/custom_painter.dart';
import 'header_component/header_widget.dart';
import 'header_component/people_header.dart';
import 'header_component/promotion_header.dart';
import 'invite_component/invite_section.dart';

class GooglePayHome extends StatefulWidget {
  late List<UserModel> chatmodels;
  late UserModel sourceChat;
  GooglePayHome(this.chatmodels, this.sourceChat);
  @override
  _GooglePayHomeState createState() => _GooglePayHomeState();
}

class _GooglePayHomeState extends State<GooglePayHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://media.licdn.com/dms/image/D4D16AQFXrPLf7-FePQ/profile-displaybackgroundimage-shrink_350_1400/0/1692073023768?e=1715212800&v=beta&t=drZk7Q2nLQS8ItzWUinUlczlz6so5Uel4XTAdtIFsnY",
            ),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.dstATop, // Adjust the opacity here
            ),
          ),
        ),
        child: Stack(
          children: [
            HeaderWidget(chatmodels: widget.chatmodels,),
            Divider(),
            DraggableScrollableSheet(
              initialChildSize: 0.7,
              minChildSize: 0.6,
              builder:
                  (BuildContext context, ScrollController myScrollController) {
                return ListView.builder(
                  controller: myScrollController,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(16)),
                              height: 5,
                              width: 40,
                            ),
                          ),
                          Container(
                            height: 190,
                            width: double.infinity,
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4),
                                itemBuilder: (context, index) {
                                  return GridTile(
                                      child: MenuTile(
                                    mainMenu: dummyMain[index],
                                  ));
                                },
                                itemCount: dummyMain.length),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          PeopleHeader(),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [],
                          ),

                          UserDetails(chatModel: widget.chatmodels,sourceChat: widget.sourceChat,myscrollcontroller: myScrollController,isBusiness: false),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Add your onPressed logic here
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                child:Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Activate UPI Lite',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(width: 8), // Add spacing between text and suffix
                                    Icon(Icons.add_circle_outline),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  width: 20), // Add spacing between buttons
                              ElevatedButton(
                                onPressed: () {
                                  // Add your onPressed logic here
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue.shade50,
                                  onPrimary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),

                                  ),
                                ),
                                child: Text('UPI ID: ${ widget.sourceChat.upiId}',style: TextStyle(color: Colors.black)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          BusinessHeader(),
                          SizedBox(),
                          // BusinessBanner(),
                          SizedBox(
                            height: 20,
                          ),
                          BusinessUserDetails(myscrollcontroller: myScrollController,isBusiness: true),
                          SizedBox(
                            height: 30,
                          ),
                          Divider(),
                          SizedBox(
                            height: 30,
                          ),
                          PromotionHeader(),
                          SizedBox(
                            height: 50,
                          ),
                          PrompotionData(),
                          SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25),
                            child: Row(children: [
                              Text(
                                "Manage your money",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                              )
                            ]),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CashUtils(),
                          SizedBox(
                            height: 50,
                          ),
                          InviteSection()
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
