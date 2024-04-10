import 'package:flutter/material.dart';

Widget currentlistWeather(
    String location, String descrip, String temp, String typeIcon) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
    height: 150.0,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          blurRadius: 30.0,
          offset: Offset(0, 10.0),
        ),
      ],
      borderRadius: BorderRadius.circular(25.0),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$location',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50.0),
              Text(
                '$descrip',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 16.0),
        Text(
          '$temp°',
          style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 16.0),
        Image.network(
          'https://openweathermap.org/img/wn/$typeIcon@2x.png',
          width: 55.0,
          height: 55.0,
        ),
      ],
    ),
  );
}
