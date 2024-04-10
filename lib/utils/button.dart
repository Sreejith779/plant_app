import 'package:flutter/material.dart';

Widget buttons(BuildContext context,
    {required String label,
      Color? buttonColor,
      Color? textColor,
      required void Function() onPressed}) {
  return Container(
    margin: const EdgeInsets.only(left: 25, right: 25),
    width: MediaQuery.of(context).size.width,
    child: MaterialButton(
      onPressed: onPressed,
      shape: const StadiumBorder(),
      color: buttonColor,
      height: 40,
      child: Text(
        label,
        style: TextStyle(color: textColor, fontSize: 18),
      ),
    ),
  );
}