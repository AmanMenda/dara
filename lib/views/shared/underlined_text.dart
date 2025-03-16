import 'package:dara/theme/sizes.dart';
import 'package:flutter/material.dart';

class UnderlinedText extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final Color underlineColor;

  const UnderlinedText({
    super.key,
    required this.text,
    required this.onPressed,
    required this.textColor,
    required this.underlineColor
  });

  @override
  Widget build(BuildContext context){
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(vertical: Spacing.medium)),
        ),
        onPressed: onPressed,
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              height: 2,
              width: 40,
              color: underlineColor,
            )
          ],
        ),
      ),
    );
  }
}