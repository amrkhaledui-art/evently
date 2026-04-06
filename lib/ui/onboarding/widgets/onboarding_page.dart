import 'package:flutter/material.dart';
import 'package:project_sadat/core/resources/color_manager.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final Widget? dots;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    this.dots,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mq = MediaQuery.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Responsive Image — scales to 45% of screen height
          SizedBox(
            height: mq.size.height * 0.45,
            width: double.infinity,
            child: Image.asset(
              image,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Icon(Icons.image, size: 80, color: Colors.grey),
                  ),
                );
              },
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
            maxLines: 10,
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
