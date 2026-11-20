import 'package:flutter/material.dart';

import '../../../core/constants/api_endpoints.dart';
import '../../../core/widgets/module_screen.dart';

/// Admin Dashboard module page (checkpoint). Admin accounts only.
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ModuleScreen(
      title: 'Admin Dashboard',
      icon: Icons.dashboard,
      description:
          'Administrator tools: moderation, helpdesk queue, users and '
          'content management.',
      plannedFeatures: const [
        'Overview of what needs attention',
        'Helpdesk queue: assign, reply, change status',
        'Manage challenges, badges and goals',
        'Users and feed moderation',
      ],
      endpoints: [
        ApiCheckTarget(
          'Overview (admin sign-in required)',
          ApiEndpoints.dashboardOverview,
        ),
      ],
    );
  }
}
