import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_sadat/core/resources/AssetsManager.dart';
import 'package:project_sadat/core/resources/color_manager.dart';
import 'package:project_sadat/ui/home/data/sample_events.dart';
import 'package:project_sadat/ui/home/widgets/event_card.dart';
import 'package:project_sadat/model/event_model.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late List<EventItemData> _favoriteEvents;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    // For now, let's assume all sample events are favorite for demonstration
    // or just use the same list. In a real app, this would come from a repo.
    _favoriteEvents = sampleEvents()
        .map(
          (e) => EventItemData(
            title: e.title,
            description: e.description,
            dateDay: e.dateDay,
            dateMonth: e.dateMonth,
            imageAsset: e.imageAsset,
            imageAssetDark: e.imageAssetDark,
            isFavorite: true,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filteredEvents = _favoriteEvents.where((e) {
      return e.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          e.description.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

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
                      TextFormField(
                        onChanged: (value) => setState(() => _searchQuery = value),
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: ColorManager.primary(context),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search for event',
                          hintStyle: theme.textTheme.bodyLarge?.copyWith(
                            color: ColorManager.primary(context),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              AssetsManager.search,
                              colorFilter: ColorFilter.mode(
                                ColorManager.primary(context),
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: ColorManager.primary(context),
                              width: 1.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: ColorManager.primary(context),
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: ColorManager.primary(context),
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      ...filteredEvents.map(
                        (e) => EventCard(
                          event: e,
                          onFavoriteToggle: () {
                            setState(() {
                              _favoriteEvents.remove(e);
                            });
                          },
                        ),
                      ),
                      if (filteredEvents.isEmpty)
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Text(
                              'No favorites found',
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: ColorManager.textSecondary(context),
                              ),
                            ),
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
