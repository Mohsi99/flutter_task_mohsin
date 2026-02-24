import 'package:flutter/material.dart';

import '../../models/regional_plan.dart';
import '../common/app_colors.dart';
import '../common/app_text_styles.dart';

class RegionalPlanCard extends StatelessWidget {
  final RegionalPlan plan;
  final bool isSelected;
  final VoidCallback onTap;

  const RegionalPlanCard({
    super.key,
    required this.plan,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: isSelected
              ? const LinearGradient(
            colors: [Color(0xFF329CFB), Color(0xFF15D59D)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
              : null,
          border: isSelected
              ? null
              : Border.all(color: AppColors.divider),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.all(isSelected ? 1.5 : 0),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(15),
          ),
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding:
          const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          height: 28,
          decoration: BoxDecoration(
            color: const Color(0xffEEF7FF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            plan.name,
            style: AppTextStyles.regionalPlanName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Data:', style: AppTextStyles.regionalPlanDetail),
                const SizedBox(height: 4),
                Text(
                  plan.dataAmount,
                  style: AppTextStyles.regionalPlanDetail
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Valid for:',
                    style: AppTextStyles.regionalPlanDetail),
                const SizedBox(height: 4),
                Text(
                  plan.validityText,
                  style: AppTextStyles.regionalPlanDetail
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 8),
        Divider(color: AppColors.divider),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                '${plan.supportedCountries} Supported Countries',
                style: AppTextStyles.regionalPlanCountries,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            const Icon(Icons.chevron_right, size: 20),
          ],
        ),

        Divider(color: AppColors.divider),

        const SizedBox(height: 8),

        Text(
          plan.priceText,
          style: AppTextStyles.regionalPlanPrice,
        ),
      ],
    );
  }
}