import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _primary = Color(0xFF66FCF1);
  static const Color _onPrimary = Color(0xFF062B2A);

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: _primary,
      onPrimary: _onPrimary,
      surface: Colors.white,
    ),
    primaryColor: _primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: _primary,
      elevation: 0,
      centerTitle: false,
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(color: Color(0xFF0B0C10)),
      titleMedium: TextStyle(color: Color(0xFF263345)),
      bodyMedium: TextStyle(color: Color(0xFF263345)),
    ),
    iconTheme: const IconThemeData(color: Color(0xFF263345)),
    extensions: <ThemeExtension<dynamic>>[
      const AppColors(
        pinkStart: Color(0xFFFFE8F0),
        pinkEnd: Color(0xFFFFD0E0),
        pinkAccent: Color(0xFFD8236A),
        pinkLight: Color(0xFFF7DDE0),
        pinkPill: Color(0xFFF7DDE6),
        pinkActive: Color(0xFFF36E9A),
      ),
    ],
    useMaterial3: false,
  );
}

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.pinkStart,
    required this.pinkEnd,
    required this.pinkAccent,
    required this.pinkLight,
    required this.pinkPill,
    required this.pinkActive,
  });

  final Color pinkStart;
  final Color pinkEnd;
  final Color pinkAccent; // strong pink used for selected icons
  final Color pinkLight; // light rounded background
  final Color pinkPill; // pill gradient color
  final Color pinkActive; // active pill color in segments

  @override
  AppColors copyWith({
    Color? pinkStart,
    Color? pinkEnd,
    Color? pinkAccent,
    Color? pinkLight,
    Color? pinkPill,
    Color? pinkActive,
  }) {
    return AppColors(
      pinkStart: pinkStart ?? this.pinkStart,
      pinkEnd: pinkEnd ?? this.pinkEnd,
      pinkAccent: pinkAccent ?? this.pinkAccent,
      pinkLight: pinkLight ?? this.pinkLight,
      pinkPill: pinkPill ?? this.pinkPill,
      pinkActive: pinkActive ?? this.pinkActive,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      pinkStart: Color.lerp(pinkStart, other.pinkStart, t)!,
      pinkEnd: Color.lerp(pinkEnd, other.pinkEnd, t)!,
      pinkAccent: Color.lerp(pinkAccent, other.pinkAccent, t)!,
      pinkLight: Color.lerp(pinkLight, other.pinkLight, t)!,
      pinkPill: Color.lerp(pinkPill, other.pinkPill, t)!,
      pinkActive: Color.lerp(pinkActive, other.pinkActive, t)!,
    );
  }
}
