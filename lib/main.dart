// All Rights Reserved (ARR)
// Copyright (c) 2022 NotSuitable Group LTD
// Created by DanikingRD https://github.com/DanikingRD

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mysub/constant/firebase_options.dart';
import 'package:mysub/mysub.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MySubApp());
}

