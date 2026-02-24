import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class CountryDetailView extends StackedView<CountryDetailViewModel> {
  const CountryDetailView({super.key});

  @override
  Widget builder(BuildContext context,
      CountryDetailViewModel viewModel,
      Widget? child,) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAppBar(context),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),
                              _buildSearchBar(),
                              const SizedBox(height: 8),
                              const CountryChip(countryName: 'Turkey'),
                              const SizedBox(height: 17),
                              _buildFilterTabs(viewModel),
                              const SizedBox(height: 8),
                              Text(
                                '${viewModel
                                    .bundleCount} Bundles Available for Turkey',
                                style: AppTextStyles.sectionTitle,
                              ),
                              _buildBundleGrid(context, viewModel),
                              const SizedBox(height: 8),
                              _buildRegionalSection(viewModel),
                              const SizedBox(height: 24),
                              _buildSupportSection(),
                              const SizedBox(height: 100),
                            ],
                          ),
                        ],
                      ),
                    ), // Bottom padding for cart bar
                  ],
                ),
              ),
            ),
            const CheckoutBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.appBarGradient,
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios_new,
                    color: AppColors.textWhite, size: 20),
              ),
              Text(
                'Turkey',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textWhite,
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

  Widget _buildBundleGrid(BuildContext context,
      CountryDetailViewModel viewModel) {
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
            childAspectRatio: 0.77,
          ),
          itemCount: plans.length,
          itemBuilder: (context, index) {
            return Consumer<CartProvider>(
              builder: (context, cart, _) {
                final plan = plans[index];

                return RegionalPlanCard(
                  plan: plan,
                  isSelected: cart.containsRegionalPlan(plan),
                  onTap: () => cart.toggleRegionalPlan(plan),
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildSupportSection() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Need support?',
                  style: TextStyle(
                    color: Color(0xff001C3E),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  )),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    'If you need help, contact us on ',
                    style: TextStyle(
                      color: Color(0xff001C3E),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Image.asset(
                    'assets/images/logos_whatsapp-icon.png', height: 24,
                    width: 24,),
                  const SizedBox(width: 4),
                  Text(
                    'Whatsapp',
                    style: TextStyle(
                      color: Color(0xff1EC896),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  CountryDetailViewModel viewModelBuilder(BuildContext context) =>
      CountryDetailViewModel();
}
