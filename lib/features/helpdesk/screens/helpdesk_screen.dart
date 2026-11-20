import 'package:flutter/material.dart';

import '../../../core/constants/api_endpoints.dart';
import '../../../core/widgets/module_screen.dart';

/// Help Desk module page (checkpoint).
class HelpdeskScreen extends StatelessWidget {
  const HelpdeskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ModuleScreen(
      title: 'Help Desk',
      icon: Icons.support_agent,
      description: 'Ask the SELARAS team for help and follow your tickets.',
      plannedFeatures: const [
        'Submit a ticket with priority and screenshots',
        'Ticket list with status filters',
        'Conversation with the support team',
      ],
      endpoints: [ApiCheckTarget('Tickets', ApiEndpoints.helpdeskTickets)],
    );
  }
}
