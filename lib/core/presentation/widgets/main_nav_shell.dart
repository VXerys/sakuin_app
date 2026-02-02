import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakuin_app/core/theme/app_theme.dart';

class MainNavShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainNavShell({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          color: Theme.of(context).colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 12,
              top: 8,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 18,
                    offset: Offset(0, -6),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _navItem(
                    context,
                    icon: Icons.chat_bubble_outline,
                    index: 0,
                    onTap: () => navigationShell.goBranch(0),
                  ),

                  // Center elevated item
                  _centerNavItem(
                    context,
                    colors: colors,
                    isSelected: navigationShell.currentIndex == 1,
                    onTap: () => navigationShell.goBranch(1),
                  ),

                  _navItem(
                    context,
                    icon: Icons.person_outline,
                    index: 2,
                    onTap: () => navigationShell.goBranch(2),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(
    BuildContext context, {
    required IconData icon,
    required int index,
    required VoidCallback onTap,
  }) {
    final selected = navigationShell.currentIndex == index;
    final colors = Theme.of(context).extension<AppColors>()!;
    final color = selected ? colors.pinkAccent : const Color(0xFF9AA1AC);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Icon(icon, color: color, size: 26),
      ),
    );
  }

  Widget _centerNavItem(
    BuildContext context, {
    required AppColors colors,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [colors.pinkStart, colors.pinkEnd],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(18),
              blurRadius: 14,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            Icons.home,
            size: 28,
            color: isSelected ? colors.pinkAccent : const Color(0xFF9AA1AC),
          ),
        ),
      ),
    );
  }
}
