import 'package:flutter/material.dart';

class ReplyCard extends StatelessWidget {
  String msg;
  final String time;
  ReplyCard({required this.msg,required this.time});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 60, top: 10, bottom: 20),
              child: Text(
                msg,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Positioned(
              bottom: 4,
              right: 10,
              child: Text(
                time,
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
