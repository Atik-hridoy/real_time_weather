import 'package:flutter/material.dart';

String formatTemperature(String temperature) {
  return '$temperature°C';
}

void showErrorSnackBar(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        errorMessage,
        style: TextStyle(fontSize: 16),
      ),
      backgroundColor: Colors.red,
    ),
  );
}
