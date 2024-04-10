import 'package:flutter/material.dart';

Widget weatehrIcon(String typeIcon) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 200.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://openweathermap.org/img/wn/$typeIcon@4x.png'),
          ),
        ),
      ),
    ],
  );
}
