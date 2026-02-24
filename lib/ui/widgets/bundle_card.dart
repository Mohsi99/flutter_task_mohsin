import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/app_text_styles.dart';
import '../../models/bundle_plan.dart';

class BundleCard extends StatelessWidget {
  final BundlePlan bundle;
  final bool isSelected;
  final VoidCallback onTap;

  const BundleCard({
    super.key,
    required this.bundle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 109,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: isSelected
                  ? const LinearGradient(
                      colors: [Color(0xFF329CFB), Color(0xFF15D59D)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: isSelected ? null : const Color(0xFFEEF7FF),
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.all(isSelected ? 1.5 : 1),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                // ✅ Always solid, gradient only shows as border
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 8),
                        width: 65,
                        height: 28,
                        decoration: BoxDecoration(
                          color: const Color(0xffEEF7FF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${bundle.dataAmount} ${bundle.dataUnit}'.trim(),
                          style: AppTextStyles.bundleDataAmount,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Valid for:',
                        style: AppTextStyles.bundleValidity,
                      ),
                      Text(
                        bundle.validityText,
                        style: AppTextStyles.bundleValidityValue,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Divider(
                    color: Color(0xFFCCCCCC),
                    thickness: 1,
                    height: 16,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    bundle.priceText,
                    style: AppTextStyles.bundlePrice,
                  ),
                ],
              ),
            )));
  }
}
