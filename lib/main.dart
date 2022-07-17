import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mysub/firebase_options.dart';
import 'package:mysub/mysub.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MySubApp());
}

