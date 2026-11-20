import 'package:flutter/material.dart';

import '../../../core/constants/api_endpoints.dart';
import '../../../core/widgets/module_screen.dart';

/// Green Challenges module page (checkpoint).
class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ModuleScreen(
      title: 'Green Challenges',
      icon: Icons.eco,
      description:
          'Daily and weekly eco challenges with progress, streaks and badges.',
      plannedFeatures: const [
        'Challenge catalog',
        'Join a challenge and log daily progress',
        'Weather advice for outdoor challenges',
        'Badge collection',
      ],
      endpoints: [ApiCheckTarget('Challenges', ApiEndpoints.challenges)],
    );
  }
}
