import 'package:flutter/material.dart';
import 'package:project_sadat/core/resources/color_manager.dart';

class EventInputField extends StatelessWidget {
  const EventInputField({
    super.key,
    required this.icon,
    required this.text,
    required this.actionText,
    this.onActionTap,
  });

  final IconData icon;
  final String text;
  final String actionText;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onActionTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: ColorManager.textPrimary(context),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: ColorManager.textPrimary(context),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              actionText,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: ColorManager.primary(context),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
