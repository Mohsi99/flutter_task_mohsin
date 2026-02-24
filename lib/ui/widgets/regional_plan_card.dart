import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/app_text_styles.dart';
import '../../models/regional_plan.dart';

/// A card widget for displaying a regional or global eSIM plan.
///
/// Shows the plan name, data amount, validity, supported countries count,
/// and price.
class RegionalPlanCard extends StatelessWidget {
  final RegionalPlan plan;

  const RegionalPlanCard({
    super.key,
    required this.plan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Plan name
          Text(
            plan.name,
            style: AppTextStyles.regionalPlanName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          // Data row
          Row(
            children: [
              Text('Data:', style: AppTextStyles.regionalPlanDetail),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  plan.dataAmount,
                  style: AppTextStyles.regionalPlanDetail.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text('Valid for:', style: AppTextStyles.regionalPlanDetail),
              const SizedBox(width: 4),
              Text(
                plan.validityText,
                style: AppTextStyles.regionalPlanDetail.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Supported Countries
          Row(
            children: [
              Expanded(
                child: Text(
                  '${plan.supportedCountries} Supported Countries',
                  style: AppTextStyles.regionalPlanCountries,
                ),
              ),
              const Icon(
                Icons.chevron_right,
                size: 16,
                color: AppColors.textSecondary,
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Price
          Text(
            plan.priceText,
            style: AppTextStyles.regionalPlanPrice,
          ),
        ],
      ),
    );
  }
}
