import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/app_text_styles.dart';

/// A reusable filter tab widget (All / Standard / Unlimited).
///
/// Displays as a rounded pill — filled blue when [isSelected],
/// outlined with border when not selected.
class FilterTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterTab({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.chipSelectedBg
              : AppColors.chipUnselectedBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? Colors.transparent
                : Color(0xff329CFB),
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: isSelected
              ? AppTextStyles.filterChipSelected
              : AppTextStyles.filterChipUnselected,
        ),
      ),
    );
  }
}
