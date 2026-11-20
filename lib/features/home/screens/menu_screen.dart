import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/info_card.dart';
import '../../../core/widgets/left_drawer.dart';
import '../models/item_homepage.dart';
import '../widgets/item_card.dart';

/// Main Dashboard / Home Screen for SELARAS Mobile.
/// Implements Tutorial 08 patterns (StatelessWidget, InfoCard, and GridView of ItemCards).
class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  // Project and course identification attributes
  final String group = "Group A10";
  final String appTitle = "SELARAS Mobile";
  final String term = "PBP Gasal 26/27";

  // Action buttons representing each SELARAS module
  final List<ItemHomepage> items = [
    ItemHomepage(
      "Articles",
      Icons.menu_book,
      color: AppColors.primary500,
      // Targetscreen
    ),
    ItemHomepage(
      "Challenges",
      Icons.eco,
      color: AppColors.secondary500,
      // Targetscreen
    ),
    ItemHomepage(
      "Feed",
      Icons.forum,
      color: AppColors.secondary600,
      // Targetscreen
    ),
    ItemHomepage(
      "Donations",
      Icons.volunteer_activism,
      color: AppColors.tertiary500,
      // Targetscreen
    ),
    ItemHomepage(
      "Help Desk",
      Icons.support_agent,
      color: AppColors.secondary700,
      // Targetscreen
    ),
    ItemHomepage("Logout", Icons.logout, color: const Color(0xFFC0392B)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SELARAS',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.1),
        ),
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Row displaying three InfoCards following Tutorial 08
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoCard(title: 'Cohort', content: group),
                  InfoCard(title: 'Application', content: appTitle),
                  InfoCard(title: 'Course', content: term),
                ],
              ),
              const SizedBox(height: 24.0),

              // Welcome banner section
              Center(
                child: Column(
                  children: const [
                    Text(
                      'Welcome to SELARAS Mobile',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: AppColors.foreground,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Empowering sustainable living habits through seamless everyday actions.',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: AppColors.textMuted,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),

              // GridView containing interactive ItemCards in a 3-column layout
              GridView.count(
                primary: false,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 12),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                crossAxisCount: 3,
                children: items.map((ItemHomepage item) {
                  return ItemCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
