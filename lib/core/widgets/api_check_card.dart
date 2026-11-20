import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../network/api_check.dart';

/// Shows whether one DRF endpoint answers, with a retry button.
/// Checkpoint widget: replaced by real data screens as modules are built.
class ApiCheckCard extends StatefulWidget {
  final String label;
  final String url;

  const ApiCheckCard({super.key, required this.label, required this.url});

  @override
  State<ApiCheckCard> createState() => _ApiCheckCardState();
}

class _ApiCheckCardState extends State<ApiCheckCard> {
  late Future<ApiCheckResult> _future;

  @override
  void initState() {
    super.initState();
    _future = ApiCheck.get(widget.url);
  }

  void _retry() => setState(() => _future = ApiCheck.get(widget.url));

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: FutureBuilder<ApiCheckResult>(
          future: _future,
          builder: (context, snapshot) {
            final result = snapshot.data;
            final loading = snapshot.connectionState != ConnectionState.done;

            final (IconData icon, Color color) = switch (result?.status) {
              ApiCheckStatus.ok => (Icons.check_circle, AppColors.primary600),
              ApiCheckStatus.authRequired => (
                Icons.lock_outline,
                AppColors.secondary500,
              ),
              ApiCheckStatus.failed => (
                Icons.error_outline,
                const Color(0xFFC0392B),
              ),
              null => (Icons.hourglass_empty, AppColors.textMuted),
            };

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (loading)
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    else
                      Icon(icon, color: color),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        widget.label,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.foreground,
                        ),
                      ),
                    ),
                    IconButton(
                      tooltip: 'Check again',
                      onPressed: loading ? null : _retry,
                      icon: const Icon(Icons.refresh),
                    ),
                  ],
                ),
                SelectableText(
                  widget.url,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  loading ? 'Checking…' : (result?.summary ?? ''),
                  style: TextStyle(fontSize: 13, color: color),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
