import 'package:flutter/material.dart';
import 'package:project_sadat/core/resources/AssetsManager.dart';
import 'package:project_sadat/core/resources/color_manager.dart';

class EventItemData {
  final String title;
  final String description;
  final String dateDay;
  final String dateMonth;
  final String imageAsset;
  final String imageAssetDark;
  final bool isFavorite;

  const EventItemData({
    required this.title,
    required this.description,
    required this.dateDay,
    required this.dateMonth,
    required this.imageAsset,
    required this.imageAssetDark,
    this.isFavorite = false,
  });
}

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event, this.onFavoriteToggle});

  final EventItemData event;
  final VoidCallback? onFavoriteToggle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight = screenHeight * 0.22;
    final displayImage = AssetsManager.getThemeAwareAsset(
      context,
      event.imageAsset,
      event.imageAssetDark,
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.background(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorManager.primary(context), width: 1.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image.asset(
                  displayImage,
                  height: imageHeight,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: imageHeight,
                    width: double.infinity,
                    color: ColorManager.borderField(context),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.event_rounded,
                      color: ColorManager.primary(context),
                      size: 48,
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: ColorManager.white(
                        context,
                      ).withValues(alpha: 0.85),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          event.dateDay,
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: ColorManager.primary(context),
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          event.dateMonth,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: ColorManager.primary(context),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: ColorManager.textPrimary(context),
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          event.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: ColorManager.textSecondary(context),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: onFavoriteToggle,
                    icon: Icon(
                      event.isFavorite
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: ColorManager.primary(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
