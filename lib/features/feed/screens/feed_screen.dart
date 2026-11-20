import 'package:flutter/material.dart';

import '../../../core/constants/api_endpoints.dart';
import '../../../core/widgets/module_screen.dart';

/// Community Feed module page (checkpoint).
class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ModuleScreen(
      title: 'Community Feed',
      icon: Icons.forum,
      description:
          'Stories and progress shared by the community, with likes and '
          'comments.',
      plannedFeatures: const [
        'Community timeline',
        'Likes and threaded comments',
        'Create a post with photos',
      ],
      endpoints: [ApiCheckTarget('Feed posts', ApiEndpoints.feedPosts)],
    );
  }
}
