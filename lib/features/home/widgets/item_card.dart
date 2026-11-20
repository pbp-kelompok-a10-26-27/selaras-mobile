import 'package:flutter/material.dart';

import '../models/item_homepage.dart';

/// Reusable ItemCard widget adhering to Tutorial 08 PBP specifications.
/// Displays an interactive action card with ink ripple effects, SnackBar feedback,
/// and navigation to the designated module screen if defined.
class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // Display responsive SnackBar notification as specified in Tutorial 08
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text("You tapped the ${item.name} button!"),
                duration: const Duration(seconds: 2),
              ),
            );

          // Navigate to the target module screen if present
          if (item.route != null) {
            Navigator.pushNamed(context, item.route!);
          } else if (item.targetScreen != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => item.targetScreen!),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, color: Colors.white, size: 32.0),
                const SizedBox(height: 6),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
