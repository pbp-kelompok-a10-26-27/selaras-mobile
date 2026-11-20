import 'package:flutter/material.dart';

/// Data model representing action buttons on the home screen.
/// Implements Tutorial 08 conventions with optional navigation routing.
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;
  final Widget? targetScreen;

  /// Named route to open (see `AppRoutes`). Preferred over [targetScreen].
  final String? route;

  ItemHomepage(
    this.name,
    this.icon, {
    this.color = const Color(0xFF4C623F),
    this.targetScreen,
    this.route,
  });
}
