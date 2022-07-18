// All Rights Reserved (ARR)
// Copyright (c) 2022 NotSuitable Group LTD
// Created by DanikingRD https://github.com/DanikingRD

import 'package:flutter/material.dart';

/// Represents a button that can be selected.
class SelectableButton extends StatelessWidget {
  /// Event triggered when this button is pressed.
  final VoidCallback onPressed;

  /// The title of this button
  final String title;
  final Color bgColor;
  final Color fgColor;
  final bool selected;
  final Color selectedBorderColor;
  final Color selectedBgColor;
  final Color selectedFgColor;
  final EdgeInsets padding;

  const SelectableButton({
    required this.title,
    required this.onPressed,
    required this.bgColor,
    required this.selected,
    this.fgColor = Colors.black,
    this.selectedBorderColor = Colors.black,
    this.selectedBgColor = Colors.transparent,
    this.selectedFgColor = Colors.black,
    this.padding = const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        backgroundColor: MaterialStateProperty.all(selected ? selectedBgColor : bgColor),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: selected ? selectedBorderColor : Colors.black,
            width: 2.0,
          ),
        ),
      ),
      child: Padding(
        padding: padding,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: selected ? selectedFgColor : fgColor,
              ),
        ),
      ),
    );
  }
}
