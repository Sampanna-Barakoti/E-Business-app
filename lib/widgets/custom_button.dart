import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final Widget? icon;
  final Color? borderColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = const Color.fromARGB(255, 0, 106, 255),
    required this.textColor,
    this.icon,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side:
                borderColor != null
                    ? BorderSide(color: borderColor!, width: 2)
                    : BorderSide.none,
          ),
        ),
        onPressed: onPressed,
        child:
            icon != null
                ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon!,
                    const SizedBox(width: 8),
                    Text(
                      text,
                      style: TextStyle(fontSize: 18, color: textColor),
                    ),
                  ],
                )
                : Text(text, style: TextStyle(fontSize: 18, color: textColor)),
      ),
    );
  }
}
