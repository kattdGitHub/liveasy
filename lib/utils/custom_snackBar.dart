import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String message,
    {bool isError = false}) {
  ScaffoldMessenger.of(context).showSnackBar(
    customSnackBar(
      message: message,
      backgroundColor: isError ? Colors.red : Colors.green,
      textColor: Colors.white,
      icon: Icons.check_circle,
      duration: Duration(seconds: 4),
    ),
  );
}

SnackBar customSnackBar({
  required String message,
  Color backgroundColor = Colors.black,
  Color textColor = Colors.white,
  IconData icon = Icons.info,
  Duration duration = const Duration(seconds: 3),
}) {
  return SnackBar(
    content: Row(
      children: [
        Icon(icon, color: textColor),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            message,
            style: TextStyle(color: textColor),
          ),
        ),
      ],
    ),
    backgroundColor: backgroundColor,
    duration: duration,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
