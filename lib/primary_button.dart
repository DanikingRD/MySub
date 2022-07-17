import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mysub/colors.dart';

/// [PrimaryButton] is the primary button for MySub app.
/// It is mainly used for registration process.
class PrimaryButton extends StatelessWidget {
  /// Event triggered when this button is pressed.
  final VoidCallback onPressed;

  /// The title of this button
  final String title;

  /// Background color
  final Color bgColor;

  /// Foreground color for the title
  final Color fgColor;

  /// Padding for the title
  final EdgeInsets padding;

  /// Whether this button will have outlined border
  /// When Outlined is active, the [bgColor] and [fgColor] passed in will be ignored.
  final bool outlined;

  const PrimaryButton({
    required this.onPressed,
    required this.title,
    Key? key,
    this.bgColor = kPrimaryColor,
    this.fgColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
    this.outlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        overlayColor: MaterialStateProperty.all(outlined ? Colors.grey.shade300 : Colors.black26),
        backgroundColor: MaterialStateProperty.all(
          outlined ? Colors.white : bgColor,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
        ),
        side: outlined
            ? MaterialStateProperty.all(
                const BorderSide(color: Colors.black),
              )
            : null,
      ),
      child: Padding(
        padding: padding,
        child: Text(
          title,
          style: TextStyle(color: outlined ? Colors.black : fgColor),
        ),
      ),
    );
  }
}
