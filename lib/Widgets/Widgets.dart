import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget topBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Flutter"),
      Text("Wallpaper", style: TextStyle(color: Colors.red)),
    ],
  );
}
