import 'package:flutter/material.dart';

import '../../model/userModel.dart';


class BusinessUserDetails extends StatelessWidget {
  final bool isBusiness;
  final ScrollController myscrollcontroller;
  BusinessUserDetails({required this.myscrollcontroller, required this.isBusiness});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (context, index) {
          if (dummyData.length == index) {
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
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        businessdummyData[index].imgUrl),
                    radius: 30,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    businessdummyData[index].name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            );
          }
        },
        itemCount: businessdummyData.length ,
      ),
    );
  }
}
