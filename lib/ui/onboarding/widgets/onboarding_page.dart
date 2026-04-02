import 'package:flutter/material.dart';
import 'package:project_sadat/core/resources/color_manager.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final Widget? dots;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    this.dots,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image placeholder scales to 35% of screen height
          Container(
            height: screenHeight * 0.35,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Icon(Icons.image, size: 80, color: Colors.grey),
            ),
          ),
          if (dots != null) ...[
            const SizedBox(height: 16),
            Center(child: dots!),
          ],
          const SizedBox(height: 24),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: ColorManager.primary(context),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: ColorManager.textPrimary(context),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
