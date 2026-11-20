import 'package:flutter/material.dart';

import '../../../core/constants/api_endpoints.dart';
import '../../../core/widgets/module_screen.dart';

/// Green Donations module page (checkpoint).
class DonationsScreen extends StatelessWidget {
  const DonationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ModuleScreen(
      title: 'Green Donations',
      icon: Icons.volunteer_activism,
      description:
          'Fund ecological initiatives and follow how far each campaign has '
          'come.',
      plannedFeatures: const [
        'Campaign listing with progress',
        'Donation form with payment proof upload',
        'Donor wall',
      ],
      endpoints: [
        ApiCheckTarget('Donation campaigns', ApiEndpoints.donationCampaigns),
      ],
    );
  }
}
