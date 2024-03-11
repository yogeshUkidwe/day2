import 'package:flutter/material.dart';

class OwnMessageCard extends StatelessWidget {
  String msg;
  final String time;
  OwnMessageCard({required this.msg,required this.time});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          color: Colors.blue.shade50,
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
              child: Row(
                children: [
                  Text(
                    time,
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
