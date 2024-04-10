import 'package:flutter/material.dart';

Widget HLTemp(String descrip, String Htemp, String Ltemp) {
  return Center(
    child: Column(
      children: [
        Text(
          '$descrip',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'L:$Ltemp°',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(width: 10.0),
            Text(
              'H:$Htemp°',
              style: TextStyle(
                fontSize: 20.0,
              ),
            )
          ],
        ),
      ],
    ),
  );
}
