import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/app_text_styles.dart';

/// A removable country tag chip (e.g., "🇹🇷 Turkey ×").
///
/// Displays the country flag circle, name, and a close button.
class CountryChip extends StatelessWidget {
  final String countryName;
  final VoidCallback? onRemove;

  const CountryChip({
    super.key,
    required this.countryName,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
      decoration: BoxDecoration(
        color: Color(0xffEEF7FF),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
        ImageIcon(
          AssetImage("assets/images/TR.png"),
          size: 24,

        ),
          const SizedBox(width: 6),
          Text(countryName,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
          if (onRemove != null) ...[
            const SizedBox(width: 4),
            GestureDetector(
              onTap: onRemove,
              child: ImageIcon(
                AssetImage("assets/images/close.png"),
                size: 16,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
