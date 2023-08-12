import 'package:flutter/material.dart';
import 'package:super_track/constants/colors.dart';

Widget TextFieldsAddUserProfile({
  required String hintText,
  required TextEditingController controller,
}) {
  return TextField(
    controller: controller,
    cursorColor: primaryCardColor,
    decoration: InputDecoration(
      hintText: hintText,
      enabled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: primaryCardColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: primaryProfileColor,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}
