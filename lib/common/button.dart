import 'package:flutter/material.dart';
import 'package:super_track/constants/colors.dart';

Widget superTrackAddButton({
  required VoidCallback onPressed,
  required String buttonText,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(
      buttonText,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryCardColor,
      elevation: 0,
      minimumSize: Size(
        double.infinity,
        50,
      ),
    ),
  );
}
