import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_sadat/core/resources/AssetsManager.dart';
import 'package:project_sadat/core/resources/color_manager.dart';
import 'package:project_sadat/core/theme/theme_mode_scope.dart';
import 'package:project_sadat/ui/home/data/sample_events.dart';
import 'package:project_sadat/ui/home/widgets/event_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String _userName = 'Amr Khaled';

  static final List<(String, String)> _categories = [
    ('All', AssetsManager.allIcon),
    ('Sport', AssetsManager.sportIcon),
    ('Birthday', AssetsManager.birthdayIcon),
    ('Meeting', AssetsManager.meetingIcon),
    ('Exhibition', AssetsManager.exhibitionIcon),
    ('Book Club', AssetsManager.bookIcon),
  ];

  int _selectedCategory = 0;

  late List<EventItemData> _events;

  @override
  void initState() {
    super.initState();
    _events = sampleEvents();
  }

  void _toggleTheme() {
    final scope = ThemeModeScope.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    scope.setThemeMode(isDark ? ThemeMode.light : ThemeMode.dark);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: ColorManager.background(context),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth > 600 ? 600.0 : constraints.maxWidth;
          return SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: maxWidth,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome Back',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: ColorManager.textSecondary(context),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _userName,
                                style: theme.textTheme.titleLarge?.copyWith(
                                  color: ColorManager.textPrimary(context),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: _toggleTheme,
                                icon: SvgPicture.asset(
                                  Theme.of(context).brightness == Brightness.dark
                                      ? AssetsManager.sun
                                      : AssetsManager.moon,
                                  colorFilter: ColorFilter.mode(
                                    ColorManager.primary(context),
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorManager.primary(context),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'EN',
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: _categories.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 12),
                          itemBuilder: (context, index) {
                            final selected = index == _selectedCategory;
                            final (label, icon) = _categories[index];
                            return GestureDetector(
                              onTap: () => setState(() => _selectedCategory = index),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  color: selected
                                      ? ColorManager.primary(context)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: ColorManager.primary(context),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      icon,
                                      colorFilter: ColorFilter.mode(
                                        selected
                                            ? Colors.white
                                            : ColorManager.primary(context),
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      label,
                                      style: theme.textTheme.bodyMedium?.copyWith(
                                        color: selected
                                            ? Colors.white
                                            : ColorManager.primary(context),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
                      ..._events.map(
                        (e) => EventCard(
                          event: e,
                          onFavoriteToggle: () {
                            setState(() {
                              final index = _events.indexOf(e);
                              _events[index] = EventItemData(
                                title: e.title,
                                description: e.description,
                                dateDay: e.dateDay,
                                dateMonth: e.dateMonth,
                                imageAsset: e.imageAsset,
                                imageAssetDark: e.imageAssetDark,
                                isFavorite: !e.isFavorite,
                              );
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
