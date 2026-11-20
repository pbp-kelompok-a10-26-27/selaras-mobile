import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../navigation/route_names.dart';

class _DrawerEntry {
  final IconData icon;
  final String title;
  final String? lead;
  final String route;

  const _DrawerEntry(this.icon, this.title, this.route, {this.lead});
}

/// Centralized navigation drawer for routing across SELARAS Mobile modules.
class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  static const List<_DrawerEntry> _entries = [
    _DrawerEntry(
      Icons.person_outline,
      'My Account',
      AppRoutes.accounts,
      lead: 'Lead: Steven',
    ),
    _DrawerEntry(
      Icons.menu_book_outlined,
      'Articles & Education',
      AppRoutes.articles,
      lead: 'Lead: Callista (Caca)',
    ),
    _DrawerEntry(
      Icons.eco_outlined,
      'Green Challenges',
      AppRoutes.challenges,
      lead: 'Lead: Fayyad',
    ),
    _DrawerEntry(
      Icons.forum_outlined,
      'Community Feed',
      AppRoutes.feed,
      lead: 'Lead: Joel',
    ),
    _DrawerEntry(
      Icons.volunteer_activism_outlined,
      'Green Donations',
      AppRoutes.donations,
      lead: 'Lead: Neisha',
    ),
    _DrawerEntry(
      Icons.support_agent_outlined,
      'Help Desk',
      AppRoutes.helpdesk,
      lead: 'Lead: Steven',
    ),
    _DrawerEntry(
      Icons.notifications_outlined,
      'Notifications',
      AppRoutes.notifications,
    ),
    _DrawerEntry(
      Icons.dashboard_outlined,
      'Admin Dashboard',
      AppRoutes.dashboard,
    ),
  ];

  /// Closes the drawer, then opens [route]. Home always stays at the bottom of
  /// the stack: from Home a module page is pushed on top, and from one module
  /// to another the page is swapped, so back always returns to Home instead of
  /// piling up module pages (or leaving the app).
  void _go(BuildContext context, String route) {
    final current = ModalRoute.of(context)?.settings.name;
    final navigator = Navigator.of(context)..pop(); // close the drawer
    if (current == route) return;
    if (route == AppRoutes.home) {
      navigator.popUntil((r) => r.settings.name == AppRoutes.home);
    } else if (current == AppRoutes.home) {
      navigator.pushNamed(route);
    } else {
      navigator.pushReplacementNamed(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    final current = ModalRoute.of(context)?.settings.name;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: AppColors.primary500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'SELARAS',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Sustainable Habit Platform',
                  style: TextStyle(fontSize: 13, color: Colors.white70),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home_outlined,
              color: AppColors.secondary500,
            ),
            title: const Text('Home'),
            selected: current == AppRoutes.home,
            onTap: () => _go(context, AppRoutes.home),
          ),
          const Divider(),
          for (final entry in _entries)
            ListTile(
              leading: Icon(entry.icon, color: AppColors.secondary500),
              title: Text(entry.title),
              subtitle: entry.lead == null
                  ? null
                  : Text(entry.lead!, style: const TextStyle(fontSize: 11)),
              selected: current == entry.route,
              onTap: () => _go(context, entry.route),
            ),
        ],
      ),
    );
  }
}
