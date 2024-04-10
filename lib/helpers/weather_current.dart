import 'package:flutter/material.dart';

Widget currentWeather(String temp, String location) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '$location',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          color: Color(0xFF5a5a5a),
        ),
      ),
      //SizedBox(height: 0.0),
      Text(
        '$temp°',
        style: TextStyle(
          fontSize: 90.0,
        ),
      ),
    ],
  );
}
