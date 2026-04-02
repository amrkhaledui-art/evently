import 'package:flutter/material.dart';
import 'package:project_sadat/core/resources/color_manager.dart';

class AuthOrDivider extends StatelessWidget {
  const AuthOrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: ColorManager.primary(context),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Or',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: ColorManager.primary(context),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: ColorManager.primary(context),
          ),
        ),
      ],
    );
  }
}
