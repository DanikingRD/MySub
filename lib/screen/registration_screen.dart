import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mysub/constant/colors.dart';
import 'package:mysub/constant/spacing.dart';
import 'package:mysub/widget/primary_button.dart';

import '../widget/primary_text_field.dart';
import '../widget/selectable_button.dart';

enum RegistrationPage { username, password, position, partner }

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with SingleTickerProviderStateMixin {
  int _activePage;
  static const _lastPage = 4;
  late final AnimationController _fadeController;
  late final Animation<double> _opacity;

  _RegistrationScreenState() : _activePage = 0;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _opacity = Tween(begin: 0.0, end: 1.0).animate(_fadeController);
    _fadeController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: FadeTransition(
          opacity: _opacity,
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
              if (_activePage == 0) ...{
                _UsernamePageBottomText(),
              } else ...{
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
      _fadeController.forward(from: 0.0);
    }
  }

  void onBack() {
    if (_activePage > 0) {
      setState(() {
        _activePage--;
      });
      _fadeController.forward(from: 0.0);
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
          style: textStyle.bodySmall!
              .copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
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

class _PositionPageBody extends StatefulWidget {
  @override
  State<_PositionPageBody> createState() => _PositionPageBodyState();
}

class _PositionPageBodyState extends State<_PositionPageBody> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        kHeaderMargin,
        Text(
          'What position are you?',
          style: theme.textTheme.bodySmall,
        ),
        kDefaultSpacing,
        SelectableButton(
          onPressed: () {
            if (_selected != 0) {
              setState(() {
                _selected = 0;
              });
            }
          },
          title: 'Submissive',
          selected: _selected == 0,
          bgColor: Colors.white,
          selectedBorderColor: kSelectedButtonColor,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
        ),
        kDefaultSpacing,
        SelectableButton(
          onPressed: () {
            if (_selected != 1) {
              setState(() {
                _selected = 1;
              });
            }
          },
          title: 'Switch',
          bgColor: Colors.white,
          selected: _selected == 1,
          selectedBorderColor: kSelectedButtonColor,
          padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 14),
        ),
        kDefaultSpacing,
        SelectableButton(
          onPressed: () {
            if (_selected != 2) {
              setState(() {
                _selected = 2;
              });
            }
          },
          title: 'Dominant',
          bgColor: Colors.white,
          selected: _selected == 2,
          selectedBorderColor: kSelectedButtonColor,
          padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 14),
        ),
      ],
    );
  }
}

class _PartnerPageBody extends StatefulWidget {
  @override
  State<_PartnerPageBody> createState() => _PartnerPageBodyState();
}

class _PartnerPageBodyState extends State<_PartnerPageBody> {
  int _selected = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        kHeaderMargin,
        Text("Let's see if you can add them!",
            style: theme.textTheme.bodySmall),
        kDefaultSpacing,
        SelectableButton(
          title: 'Yes',
          onPressed: () {
            if (_selected != 0) {
              setState(() {
                _selected = 0;
              });
            }
          },
          bgColor: Colors.white,
          selectedBorderColor: kSelectedButtonColor,
          selected: _selected == 0,
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 14),
        ),
        kDefaultSpacing,
        SelectableButton(
          title: 'No',
          onPressed: () {
            if (_selected != 1) {
              setState(() {
                _selected = 1;
              });
            }
          },
          bgColor: Colors.white,
          selectedBorderColor: kSelectedButtonColor,
          selected: _selected == 1,
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 14),
        ),

        if (_selected == 0)... {
          kDefaultSpacing,
          kTextFieldLabelMargin,
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Partners Username',
              style: theme.textTheme.bodySmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
            child: PrimaryTextField(
              controller: TextEditingController(),
            ),
          )
        }
      ],
    );
  }
}
