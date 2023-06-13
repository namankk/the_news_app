import 'package:flutter/material.dart';

AppBar mainAppBar({required MainAxisAlignment mainAxisAlignment}) {
  return AppBar(
    title: Row(
      mainAxisAlignment: mainAxisAlignment,
      children: const <Widget>[
        Text(
          "Flutter",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        Text(
          "News",
          style:
              TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w600),
        )
      ],
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}
