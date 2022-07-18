// All Rights Reserved (ARR)
// Copyright (c) 2022 NotSuitable Group LTD
// Created by DanikingRD https://github.com/DanikingRD

import 'package:flutter/material.dart';
import 'package:mysub/constant/colors.dart';

class PrimaryTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final TextInputType inputType;
  final bool obscureText;
  final Color cursorColor;

  const PrimaryTextField({
    Key? key,
    this.label,
    required this.controller,
    this.inputType = TextInputType.emailAddress,
    this.obscureText = false,
    this.cursorColor = kPrimaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: inputType,
      cursorColor: cursorColor,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: label,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kPrimaryColor,
            width: 2,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
