// All Rights Reserved (ARR)
// Copyright (c) 2022 NotSuitable Group LTD
// Created by DanikingRD https://github.com/DanikingRD

import 'package:flutter/material.dart';
import 'package:mysub/assets_path.dart';
import 'package:mysub/primary_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Image.asset(
                  intenseFeelingPath,
                  width: 204,
                  height: 156,
                ),
                const SizedBox(
                  height: 70,
                ),
                SizedBox(
                  width: 320,
                  child: Text(
                    'The best BDSM tracker out there for couples!',
                    style: textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'The worlds finest app for couples to track their BDSM life!',
                    style: textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                PrimaryButton(
                  onPressed: () {},
                  title: 'Sign in',
                  padding: const EdgeInsets.symmetric(
                    horizontal: 75,
                    vertical: 16,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                PrimaryButton(
                  onPressed: () {},
                  title: 'Sign up for free',
                  padding: const EdgeInsets.symmetric(
                    horizontal: 45,
                    vertical: 16,
                  ),
                  outlined: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
