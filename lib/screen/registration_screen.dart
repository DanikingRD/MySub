import 'package:flutter/material.dart';
import 'package:mysub/constant/colors.dart';
import 'package:mysub/constant/spacing.dart';
import 'package:mysub/widget/primary_button.dart';

import '../widget/primary_text_field.dart';

enum RegistrationPage { username, password, position, partner }

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  int _activePage;
  static const _lastPage = 4;

  _RegistrationScreenState() : _activePage = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: kDefaultPadding,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Text(
              _getPageHeader(),
              style: theme.textTheme.headlineMedium,
            ),
            _getBody(),
            const SizedBox(
              height: 40,
            ),
            PrimaryButton(
              onPressed: onContinue,
              title: 'Continue',
            ),
            const SizedBox(
              height: 20,
            ),
            if (_activePage == 0) ... {
              _UsernamePageBottomText(),
            } else...{
              PrimaryButton(
                title: 'Go back',
                outlined: true,
                onPressed: onBack,
              )
            },
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  String _getPageHeader() {
      switch (getActivePage()) {
        case RegistrationPage.username:
          return "Welcome to the\nmysub app!";
        case RegistrationPage.password:
          return "Let's get to know you a little more!";
        case RegistrationPage.position:
          return "Are you ready to use the app!";
        case RegistrationPage.partner:
          return "Is your partner here already?";
      }
  }

  Widget _getBody() {
    switch (getActivePage()) {
      case RegistrationPage.username:
        return _UsernamePageBody();
      case RegistrationPage.password:
        return _PasswordPageBody();
      case RegistrationPage.position:
        return _PositionPageBody();
      case RegistrationPage.partner:
        return _PartnerPageBody();
    }
  }
  RegistrationPage getActivePage() {
    switch (_activePage) {
      case 0:
        return RegistrationPage.username;
      case 1:
        return RegistrationPage.password;
      case 2:
        return RegistrationPage.position;
      case 3:
        return RegistrationPage.partner;
      default:
        throw ('Invalid registration page index');
    }
  }

  void onContinue() {
    if (_activePage < (_lastPage - 1)) {
      setState(() {
        _activePage++;
      });
    }
  }
  void onBack() {
    if (_activePage > 0) {
      setState(() {
        _activePage--;
      });
    }
  }
}

class _UsernamePageBottomText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Row(
      children: [
        Text(
          'Already have an account?',
          style: textStyle.bodySmall,
        ),
        const Spacer(),
        Text(
          'Sign in',
          style: textStyle.bodySmall!.copyWith(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}
class _UsernamePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeaderMargin,
        Text(
          'Full name',
          style: theme.textTheme.bodySmall,
        ),
        kTextFieldLabelMargin,
        PrimaryTextField(
          controller: TextEditingController(),
        ),
        kMultiTextFieldGaps,
        Text(
          'Username',
          style: theme.textTheme.bodySmall,
        ),
        kTextFieldLabelMargin,
        PrimaryTextField(
          controller: TextEditingController(),
        ),
        kMultiTextFieldGaps,
        Text(
          'Date of birth',
          style: theme.textTheme.bodySmall,
        ),
        kTextFieldLabelMargin,
        PrimaryTextField(
          controller: TextEditingController(),
        ),
      ],
    );
  }
}
class _PasswordPageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeaderMargin,
          Text(
            'Email Address',
            style: theme.textTheme.bodySmall,
          ),
          kTextFieldLabelMargin,
          PrimaryTextField(
            controller: TextEditingController(),
          ),
          kMultiTextFieldGaps,
          Text(
            'Password',
            style: theme.textTheme.bodySmall,
          ),
          kTextFieldLabelMargin,
          PrimaryTextField(
            controller: TextEditingController(),
          ),
          kMultiTextFieldGaps,
          Text(
            'Password Confirmation',
            style: theme.textTheme.bodySmall,
          ),
          kTextFieldLabelMargin,
          PrimaryTextField(
            controller: TextEditingController(),
          ),
        ],
      );
  }
}

class _PositionPageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _PartnerPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}