import 'package:flutter/material.dart';

class MainMenu {
  final IconData iconData;
  final String iconName;
  final Function function;

  MainMenu({
    required this.iconData,
    required this.iconName,
    required this.function
  });
}

List<MainMenu> dummyMain = [
  new MainMenu(
    iconData: Icons.qr_code_scanner,
   iconName: "Scan any QR code",
    function: (){}
  ),
  new MainMenu(
      iconData: Icons.contacts,
      iconName: "Pay Contacts",
      function: (){

      }
  ),
  new MainMenu(
      iconData: Icons.add_to_home_screen_outlined,
      iconName: "Pay phone number",
      function: (){}
  ),
  new MainMenu(
      iconData: Icons.account_balance,
      iconName: "Bank Transfer",
      function: (){}
  ),
  new MainMenu(
      iconData: Icons.alternate_email,
      iconName: "Pay UPI ID or number",
      function: (){}
  ),new MainMenu(
      iconData: Icons.person_outline_outlined,
      iconName: "Self transfer",
      function: (){}
  ),
  new MainMenu(
      iconData: Icons.featured_play_list_rounded,
      iconName: "Pay bills",
      function: (){}
  ),
  new MainMenu(
      iconData: Icons.charging_station,
      iconName: "Mobile recharge",
      function: (){}
  ),



];
