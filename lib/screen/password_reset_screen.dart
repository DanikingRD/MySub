// All Rights Reserved (ARR)
// Copyright (c) 2022 NotSuitable Group LTD
// Created by DanikingRD https://github.com/DanikingRD

import 'package:flutter/material.dart';
import 'package:mysub/constant/spacing.dart';
import 'package:mysub/widget/primary_button.dart';
import 'package:mysub/widget/primary_text_field.dart';

class PasswordResetScreen extends StatelessWidget {
  const PasswordResetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kDefaultPadding,
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Text(
                'Resetting your password',
                style: theme.textTheme.headlineMedium,
              ),
              kHeaderMargin,
              const Text(
                  "Want to reset your password? Just enter your email below and we'll send you an email reset link"),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Email',
                style: theme.textTheme.bodySmall,
              ),
              kTextFieldLabelMargin,
              PrimaryTextField(controller: TextEditingController()),
              const SizedBox(
                height: 40,
              ),
              PrimaryButton(onPressed: () {}, title: 'Send email'),
              const SizedBox(
                height: 10,
              ),
              PrimaryButton(
                onPressed: () {},
                title: 'Back to login',
                outlined: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
