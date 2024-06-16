import 'package:flutter/material.dart';

InputDecoration textFieldDecoration(String hintText, bool isLeftToRight) =>
    InputDecoration(
      hintTextDirection: TextDirection.ltr,
      hintText: hintText,
      filled: true,
      fillColor: Colors.white,
      // hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.none,
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            strokeAlign: BorderSide.strokeAlignCenter,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Colors.red,
              width: 2),
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Colors.red,
              width: 2),
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      border: const OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.none,
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
          borderRadius: BorderRadius.all(Radius.circular(80.0))),
    );
