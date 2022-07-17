// All Rights Reserved (ARR)
// Copyright (c) 2022 NotSuitable Group LTD
// Created by DanikingRD https://github.com/DanikingRD

import 'package:flutter/material.dart';
import 'package:mysub/constant/colors.dart';
import 'package:mysub/constant/spacing.dart';
import 'package:mysub/widget/primary_button.dart';
import 'package:mysub/widget/primary_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _rememberUser = false;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Text(
              'Welcome\nback!',
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 35,
            ),
            Text('Username / Email', style: theme.textTheme.bodySmall,),
            kTextFieldLabelMargin,
            PrimaryTextField(
              controller: TextEditingController(),
            ),
            kMultiTextFieldGaps,
            kTextFieldLabelMargin,
            Text('Password', style: theme.textTheme.bodySmall),
            PrimaryTextField(
              controller: TextEditingController(),
              obscureText: true,
            ),
            kMultiTextFieldGaps,
            PrimaryButton(onPressed: () {}, title: 'Sign in'),
            const SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(
                  width: 40,
                  child: Switch(
                    activeColor: kPrimaryColor,
                    hoverColor: kPrimaryColor,
                    value: _rememberUser,
                    onChanged: (bool val) => setState(() {
                      _rememberUser = val;
                    }),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Remember me',
                  style: theme.textTheme.bodySmall,
                ),
                const Spacer(),
                Text(
                  'Forgot password',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),

            const SizedBox(
              height: 18,
            ),
            Row(
              children: [
                Text(
                  "Don't have an account?",
                  style: theme.textTheme.bodySmall,
                ),
                const Spacer(),
                Text(
                  "Sign up",
                  style: theme.textTheme.bodySmall!.copyWith(
                      color: kPrimaryColor, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
