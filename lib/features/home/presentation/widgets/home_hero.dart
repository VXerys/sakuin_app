// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sakuin_app/core/theme/app_theme.dart';

class HomeHero extends StatelessWidget {
  const HomeHero({
    super.key,
    this.userName = 'Sehan',
    this.balance = '\$1,520.00',
  });

  final String userName;
  final String balance;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Hero image (rounded)
        SizedBox(
          height: 300,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/homepage/home-background.png',
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, const Color(0x22FFE6EA)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 18,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _roundedIconButton(
                            context,
                            icon: Icons.menu,
                            onTap: () {},
                          ),
                          _roundedIconButton(
                            context,
                            icon: Icons.search,
                            onTap: () {},
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      // Greeting
                      Text(
                        'Hi $userName',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF173A56),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Welcome Back',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF173A56),
                        ),
                      ),

                      const Spacer(),
                    ],
                  ),
                ),

                // Place balance card inside the hero so it appears under "Welcome Back"
                Positioned(
                  left: 18,
                  right: 70,
                  bottom: 18,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 360),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Theme.of(context).extension<AppColors>()!.pinkPill,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 26,
                            backgroundColor: Color(0xFFDBF1E8),
                            child: Text(
                              'A',
                              style: TextStyle(
                                color: Color(0xFF0B3A35),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Total balance',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: const Color(0xFF173A56),
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                balance,
                                style: theme.textTheme.titleLarge?.copyWith(
                                  color: const Color(0xFF173A56),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Action cards row (constrained width)
        Center(
          child: SizedBox(
            width: 340,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _actionCard(
                  context,
                  icon: Icons.arrow_upward,
                  label: 'Send',
                  color: const Color(0xFFFCE9EE),
                ),
                _actionCard(
                  context,
                  icon: Icons.arrow_downward,
                  label: 'Receive',
                  color: const Color(0xFFE8FFF4),
                ),
                _actionCard(
                  context,
                  icon: Icons.attach_money,
                  label: 'Loan',
                  color: const Color(0xFFFFF1DA),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _roundedIconButton(
    BuildContext context, {
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          color: Theme.of(context).extension<AppColors>()!.pinkLight,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(10),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Icon(icon, color: const Color(0xFF173A56)),
      ),
    );
  }

  Widget _actionCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
  }) {
    final theme = Theme.of(context);

    return SizedBox(
      width: 104,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 110,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(12),
                  blurRadius: 14,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: color,
                  child: Icon(icon, color: const Color(0xFF173A56)),
                ),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF173A56),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
