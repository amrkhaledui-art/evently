import 'package:flutter/material.dart';
import 'package:project_sadat/core/resources/color_manager.dart';
import 'package:project_sadat/ui/add_event/pages/add_event_page.dart';
import 'package:project_sadat/ui/home/pages/favorites_page.dart';
import 'package:project_sadat/ui/home/pages/home_page.dart';

class MainAppShell extends StatefulWidget {
  static const String routeName = 'main_shell';

  const MainAppShell({super.key});

  @override
  State<MainAppShell> createState() => _MainAppShellState();
}

class _MainAppShellState extends State<MainAppShell> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [const HomePage(), const FavoritesPage()];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: ColorManager.background(context),
      body: IndexedStack(index: _currentIndex, children: _tabs),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEventPage()),
          );
        },
        backgroundColor: ColorManager.primary(context),
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 32),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorManager.background(context),
        selectedItemColor: ColorManager.primary(context),
        unselectedItemColor: ColorManager.unselectedTab(context),
        selectedLabelStyle: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        unselectedLabelStyle: theme.textTheme.bodyMedium?.copyWith(
          fontSize: 12,
          color: ColorManager.unselectedTab(context),
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_rounded),
            activeIcon: Icon(Icons.favorite_rounded),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
