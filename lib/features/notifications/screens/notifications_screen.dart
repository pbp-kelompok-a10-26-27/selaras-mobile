import 'package:flutter/material.dart';

import '../../../core/constants/api_endpoints.dart';
import '../../../core/widgets/module_screen.dart';

/// Notifications module page (checkpoint).
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ModuleScreen(
      title: 'Notifications',
      icon: Icons.notifications,
      description: 'Likes, comments, badges and updates about your activity.',
      plannedFeatures: const [
        'Inbox with unread filter',
        'Unread badge on the bell',
        'Mark one or all as read',
      ],
      endpoints: [
        ApiCheckTarget(
          'Notifications (needs sign-in)',
          ApiEndpoints.notifications,
        ),
      ],
    );
  }
}
