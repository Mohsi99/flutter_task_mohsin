import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/app_text_styles.dart';
import '../../../providers/cart_provider.dart';
import '../../widgets/bundle_card.dart';
import '../../widgets/filter_tab.dart';
import '../../widgets/country_chip.dart';
import '../../widgets/regional_plan_card.dart';
import '../../widgets/checkout_bar.dart';
import 'country_detail_viewmodel.dart';

/// Main screen displaying eSIM bundles for a selected country (Turkey).
///
/// Uses Stacked's StackedView pattern for ViewModel binding and
/// Provider's Consumer for cart state.
class CountryDetailView extends StackedView<CountryDetailViewModel> {
  const CountryDetailView({super.key});

  @override
  Widget builder(
    BuildContext context,
    CountryDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // Gradient App Bar
          _buildAppBar(context),

          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  // Search bar
                  _buildSearchBar(),
                  const SizedBox(height: 12),
                  // Country chip
                  const CountryChip(countryName: 'Turkey'),
                  const SizedBox(height: 16),
                  // Filter tabs
                  _buildFilterTabs(viewModel),
                  const SizedBox(height: 16),
                  // Bundle count header
                  Text(
                    '${viewModel.bundleCount} Bundles Available for Turkey',
                    style: AppTextStyles.sectionTitle,
                  ),
                  // Bundle grid
                  _buildBundleGrid(context, viewModel),
                  const SizedBox(height: 24),
                  // Regional & Global Plans section
                  _buildRegionalSection(viewModel),
                  const SizedBox(height: 24),
                  // Need support section
                  _buildSupportSection(),
                  const SizedBox(height: 100), // Bottom padding for cart bar
                ],
              ),
            ),
          ),

          // Checkout bar (only visible when cart has items)
          const CheckoutBar(),
        ],
      ),
    );
  }

  /// Gradient app bar with back button, title, and cart icon.
  Widget _buildAppBar(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.appBarGradient,
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios_new,
                    color: AppColors.textWhite, size: 20),
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    'Turkey',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textWhite,
                    ),
                  ),
                ),
              ),
              ImageIcon(
                AssetImage('assets/images/Vector.png'),
                size: 24,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Rounded search bar.
  Widget _buildSearchBar() {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: TextField(
        decoration: InputDecoration(
          hintText: "Where do you need internet?",
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFFCCCCCC),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 14,
            ),
            child: ImageIcon(
              AssetImage("assets/images/search-outline.png"),
              size: 22,
              color: Color(0xFFCCCCCC),
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 14,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(999),
            borderSide: const BorderSide(
              color: Color(0xFFD0D5DD),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(999),
            borderSide: const BorderSide(
              color: Color(0xFFD0D5DD),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }

  /// Row of filter tabs: All, Standard, Unlimited.
  Widget _buildFilterTabs(CountryDetailViewModel viewModel) {
    const filters = ['All', 'Standard', 'Unlimited'];
    return Row(
      children: filters.map((filter) {
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: FilterTab(
            label: filter,
            isSelected: viewModel.selectedFilter == filter,
            onTap: () => viewModel.setFilter(filter),
          ),
        );
      }).toList(),
    );
  }

  /// 3-column grid of bundle cards.
  Widget _buildBundleGrid(
      BuildContext context, CountryDetailViewModel viewModel) {
    final bundles = viewModel.filteredBundles;
    return Consumer<CartProvider>(
      builder: (context, cart, _) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemCount: bundles.length,
          itemBuilder: (context, index) {
            final bundle = bundles[index];
            return BundleCard(
              bundle: bundle,
              isSelected: cart.containsBundle(bundle),
              onTap: () => cart.toggleBundle(bundle),
            );
          },
        );
      },
    );
  }

  /// Regional & Global Plans section with 2-column layout.
  Widget _buildRegionalSection(CountryDetailViewModel viewModel) {
    final plans = viewModel.regionalPlans;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Regional & Global Plans Supporting Turkey',
          style: AppTextStyles.sectionTitle,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.1,
          ),
          itemCount: plans.length,
          itemBuilder: (context, index) {
            return RegionalPlanCard(plan: plans[index]);
          },
        ),
      ],
    );
  }

  /// "Need support?" footer section.
  Widget _buildSupportSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Need support?', style: AppTextStyles.supportTitle),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'If you need help, contact us on ',
                      style: AppTextStyles.supportSubtitle,
                    ),
                    Icon(Icons.chat_bubble, size: 14, color: Colors.green),
                    const SizedBox(width: 4),
                    Text(
                      'Whatsapp',
                      style: AppTextStyles.supportSubtitle.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  CountryDetailViewModel viewModelBuilder(BuildContext context) =>
      CountryDetailViewModel();
}
