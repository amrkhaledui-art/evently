import 'package:flutter/material.dart';
import 'package:project_sadat/core/resources/color_manager.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function() onClick;
  final Color? backgroundColor;
  final Color foregroundColor;
  final double borderRadius;
  final double height;
  final double width;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.title,
    required this.onClick,
    this.backgroundColor,
    this.foregroundColor = Colors.white,
    this.borderRadius = 16,
    this.height = 56,
    this.width = double.infinity,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? ColorManager.primary(context),
          foregroundColor: foregroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          title,
          style: textStyle ??
              theme.textTheme.titleMedium?.copyWith(
                color: foregroundColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
        ),
      ),
    );
  }
}