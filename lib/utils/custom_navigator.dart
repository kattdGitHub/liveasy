import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void pushTo(BuildContext context, Widget child) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => child,
      ));
}

void pushReplacement(BuildContext context, Widget child) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => child,
      ));
}

void  pushAndRemoveUntil(BuildContext context, Widget child) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => child,
    ),
        (route) => false,
  );
}

void back(BuildContext context) {
  Navigator.pop(context);
}