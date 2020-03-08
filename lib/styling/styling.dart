import 'package:flutter/material.dart';

BoxDecoration mainBoxDecoration() {
  return BoxDecoration(
    border: Border.all(
      color: Colors.red[300],
    ),
    borderRadius: BorderRadius.all(
        Radius.circular(5.0),
    ),
    color: Colors.grey[100],
  );
}
