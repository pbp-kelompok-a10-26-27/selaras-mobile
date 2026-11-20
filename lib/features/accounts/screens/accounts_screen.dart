import 'package:flutter/material.dart';

import '../../../core/constants/api_endpoints.dart';
import '../../../core/widgets/module_screen.dart';

/// Accounts module page (checkpoint).
class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ModuleScreen(
      title: 'My Account',
      icon: Icons.person,
      description:
          'Sign in, manage your profile and avatar, and see your badges.',
      plannedFeatures: const [
        'Register and sign in (token based)',
        'Edit profile and avatar',
        'Change password',
        'Badge collection',
      ],
      endpoints: [
        // Needs a token, so a healthy backend answers 401 here
        ApiCheckTarget('Profile (needs sign-in)', ApiEndpoints.accountProfile),
      ],
    );
  }
}
