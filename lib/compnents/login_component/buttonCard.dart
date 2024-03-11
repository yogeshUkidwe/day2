import 'package:day2/model/userModel.dart';
import 'package:flutter/material.dart';

class ButtonCard extends StatefulWidget {
  late IconData icon;
  late String name;
  UserModel model;
  ButtonCard(this.icon, this.name, this.model);

  @override
  State<ButtonCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ButtonCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(widget.model.imgUrl),
          backgroundColor: Colors.white12,
        ),
        title: Text(
          widget.model.upiId,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),subtitle: Text(
        widget.model.bankName,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      ),
    );
  }
}
