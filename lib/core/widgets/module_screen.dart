import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'api_check_card.dart';
import 'left_drawer.dart';

/// One DRF endpoint a module page checks.
class ApiCheckTarget {
  final String label;
  final String url;

  const ApiCheckTarget(this.label, this.url);
}

/// Shared layout of a module page for this checkpoint: what the module is for,
/// what is planned, and a live check that its DRF endpoint answers.
/// Every module has its own screen class that wraps this.
class ModuleScreen extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;
  final List<String> plannedFeatures;
  final List<ApiCheckTarget> endpoints;

  const ModuleScreen({
    super.key,
    required this.title,
    required this.icon,
    required this.description,
    required this.plannedFeatures,
    required this.endpoints,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: const LeftDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: AppColors.primary200,
                child: Icon(icon, color: AppColors.primary800, size: 28),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textMuted,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const _SectionTitle('API checkpoint'),
          for (final endpoint in endpoints)
            ApiCheckCard(label: endpoint.label, url: endpoint.url),
          const SizedBox(height: 16),
          const _SectionTitle('Coming next'),
          for (final feature in plannedFeatures)
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.radio_button_unchecked,
                size: 18,
                color: AppColors.secondary300,
              ),
              title: Text(feature),
            ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.foreground,
        ),
      ),
    );
  }
}
