import 'package:flutter/material.dart';

class CashUtils extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.cabin_sharp,
              color: Colors.blue,
              size: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Get a Loan",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Colors.black.withOpacity(0.7)),
                ),
                Text(
                  "Instant approval & paperless",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Colors.black.withOpacity(0.7)),
                ),
              ],
            ),
            SizedBox(
              width: 70,
            ),
            Expanded(
                child: TextButton(onPressed: () {}, child: Text("Apply now")))
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.speed,
              color: Colors.blue,
              size: 25,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                "Check your CIBIL score for free",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Colors.black.withOpacity(0.7)),
              ),
            ),
            SizedBox(
              width: 100,
            ),
            Expanded(
              child: Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.history,
              color: Colors.blue,
              size: 25,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "See all Payment Activity",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Colors.black.withOpacity(0.7)),
            ),
            SizedBox(
              width: 100,
            ),
            Expanded(
              child: Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.account_balance,
              color: Colors.blue,
              size: 25,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Check Account Balance",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Colors.black.withOpacity(0.7)),
            ),
            SizedBox(
              width: 100,
            ),
            Expanded(
              child: Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            )
          ],
        ),
      ]),
    );
  }
}
