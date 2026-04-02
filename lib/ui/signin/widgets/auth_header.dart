import 'package:flutter/material.dart';
import 'package:project_sadat/core/resources/AssetsManager.dart';
import 'package:project_sadat/core/resources/color_manager.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    this.subtitle,
  });

  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Image.asset(
          AssetsManager.logo,
          height: 48,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => Text(
            'EVENTLY',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
              color: ColorManager.primary(context),
            ),
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: ColorManager.textSecondary(context),
            ),
          ),
        ],
      ],
    );
  }
}
