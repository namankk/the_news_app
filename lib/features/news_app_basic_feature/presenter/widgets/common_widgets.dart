import 'package:flutter/material.dart';

AppBar mainAppBar(
    {required MainAxisAlignment mainAxisAlignment, String? pageName}) {
  return AppBar(
    title: Row(
      mainAxisAlignment: mainAxisAlignment,
      children: <Widget>[
        (pageName == null)
            ? const Text(
                "Flutter",
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w600),
              )
            : Text(
                pageName,
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w600),
              ),
        const Text(
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
