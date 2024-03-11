import 'package:flutter/material.dart';

import '';
import '../../model/userModel.dart';
import 'individual_chat_page.dart';

class UserDetails extends StatelessWidget {
  List<UserModel> chatModel;
  UserModel sourceChat;
  final bool isBusiness;
  final ScrollController myscrollcontroller;
  UserDetails(
      {required this.chatModel,
      required this.sourceChat,
      required this.myscrollcontroller,
      required this.isBusiness});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (context, index) {
            if (chatModel.length == index) {
              return GridTile(
                  child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 50,
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.grey[300],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Show More",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ));
            } else {
              return GridTile(
                  child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              IndividualPage(chatModel[index], sourceChat)));
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(chatModel[index].imgUrl),
                      radius: 30,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      dummyData[index].name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ));
            }
          },
          itemCount: dummyData.length + 1),
    );
  }
}
