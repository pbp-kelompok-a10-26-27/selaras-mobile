import 'package:flutter/material.dart';

import 'core/navigation/route_names.dart';
import 'core/theme/app_theme.dart';
import 'features/accounts/screens/accounts_screen.dart';
import 'features/articles/screens/articles_screen.dart';
import 'features/challenges/screens/challenges_screen.dart';
import 'features/dashboard/screens/dashboard_screen.dart';
import 'features/donations/screens/donations_screen.dart';
import 'features/feed/screens/feed_screen.dart';
import 'features/helpdesk/screens/helpdesk_screen.dart';
import 'features/home/screens/menu_screen.dart';
import 'features/notifications/screens/notifications_screen.dart';

void main() {
  runApp(const SelarasApp());
}

/// Root widget for the SELARAS Mobile application.
class SelarasApp extends StatelessWidget {
  const SelarasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SELARAS Mobile',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (_) => MenuScreen(),
        AppRoutes.accounts: (_) => const AccountsScreen(),
        AppRoutes.articles: (_) => const ArticlesScreen(),
        AppRoutes.challenges: (_) => const ChallengesScreen(),
        AppRoutes.feed: (_) => const FeedScreen(),
        AppRoutes.donations: (_) => const DonationsScreen(),
        AppRoutes.helpdesk: (_) => const HelpdeskScreen(),
        AppRoutes.notifications: (_) => const NotificationsScreen(),
        AppRoutes.dashboard: (_) => const DashboardScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
