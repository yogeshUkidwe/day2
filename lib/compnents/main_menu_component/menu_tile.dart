import 'package:day2/model/mainMenu.dart';
import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  MainMenu mainMenu;
  MenuTile({required this.mainMenu});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        children: [
          Icon(
            mainMenu.iconData,
            color: Colors.blue,
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            mainMenu.iconName,textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, ),
          )
        ],
      ),
    );
  }
}
