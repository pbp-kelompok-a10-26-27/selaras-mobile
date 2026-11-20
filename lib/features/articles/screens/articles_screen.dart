import 'package:flutter/material.dart';

import '../../../core/constants/api_endpoints.dart';
import '../../../core/widgets/module_screen.dart';

/// Articles & Education module page (checkpoint).
class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ModuleScreen(
      title: 'Articles & Education',
      icon: Icons.menu_book,
      description:
          'Guides on sustainable living, with categories, tags and reading '
          'tracking.',
      plannedFeatures: const [
        'Article catalog with category and tag filters',
        'Reader view for full articles',
        'Reading tracker',
      ],
      endpoints: [ApiCheckTarget('Published articles', ApiEndpoints.articles)],
    );
  }
}
