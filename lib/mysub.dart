// All Rights Reserved (ARR)
// Copyright (c) 2022 NotSuitable Group LTD
// Created by DanikingRD https://github.com/DanikingRD

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mysub/colors.dart';
import 'package:mysub/login_screen.dart';
class MySubApp extends StatelessWidget {

  const MySubApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MySub',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: kPrimaryColor,
        fontFamily: GoogleFonts.rubik().fontFamily,
        textTheme: TextTheme(
          headlineMedium: GoogleFonts.roboto(
            color: const Color.fromRGBO(25, 25, 34, 1),
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
          bodySmall: GoogleFonts.rubik(
            color: const Color.fromRGBO(25, 25, 34, 1),
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
