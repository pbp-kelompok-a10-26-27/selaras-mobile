import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../../features/feed/screens/feed_screen.dart';
import '../../features/home/screens/menu_screen.dart';

/// Centralized navigation drawer for routing across SELARAS Mobile modules.
class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MenuScreen()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.menu_book_outlined,
              color: AppColors.secondary500,
            ),
            title: const Text('Articles & Education'),
            subtitle: const Text(
              'Lead: Callista (Caca)',
              style: TextStyle(fontSize: 11),
            ),
            // onTap
          ),
          ListTile(
            leading: const Icon(
              Icons.eco_outlined,
              color: AppColors.secondary500,
            ),
            title: const Text('Green Challenges'),
            subtitle: const Text(
              'Lead: Fayyad',
              style: TextStyle(fontSize: 11),
            ),
            // onTap
          ),
          ListTile(
            leading: const Icon(
              Icons.forum_outlined,
              color: AppColors.secondary500,
            ),
            title: const Text('Community Feed'),
            subtitle: const Text('Lead: Joel', style: TextStyle(fontSize: 11)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const FeedScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.volunteer_activism_outlined,
              color: AppColors.secondary500,
            ),
            title: const Text('Green Donations'),
            subtitle: const Text(
              'Lead: Neisha',
              style: TextStyle(fontSize: 11),
            ),
            // onTap
          ),
          ListTile(
            leading: const Icon(
              Icons.support_agent_outlined,
              color: AppColors.secondary500,
            ),
            title: const Text('Help Desk'),
            subtitle: const Text(
              'Lead: Steven',
              style: TextStyle(fontSize: 11),
            ),
            // onTap
          ),
        ],
      ),
    );
  }
}
