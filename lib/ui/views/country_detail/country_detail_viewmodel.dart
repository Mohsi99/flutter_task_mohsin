import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';

import '../../../models/bundle_plan.dart';
import '../../../models/regional_plan.dart';
import '../../../services/bundle_service.dart';

/// ViewModel for the Country Detail screen.
///
/// Manages filter state and provides bundle data.
class CountryDetailViewModel extends BaseViewModel {
  final _bundleService = locator<BundleService>();

  // --- Filter state ---
  String _selectedFilter = 'All';
  String get selectedFilter => _selectedFilter;

  /// All available local bundles.
  List<BundlePlan> get allBundles => _bundleService.getLocalBundles();

  /// Regional/global plans.
  List<RegionalPlan> get regionalPlans => _bundleService.getRegionalPlans();

  /// Filtered bundles based on the selected filter tab.
  List<BundlePlan> get filteredBundles {
    if (_selectedFilter == 'All') return allBundles;
    if (_selectedFilter == 'Standard') {
      return allBundles
          .where((b) => b.type == BundleType.standard)
          .toList();
    }
    if (_selectedFilter == 'Unlimited') {
      return allBundles
          .where((b) => b.type == BundleType.unlimited)
          .toList();
    }
    return allBundles;
  }

  /// Number of bundles available (based on filter).
  int get bundleCount => filteredBundles.length;

  /// Set the active filter tab.
  void setFilter(String filter) {
    _selectedFilter = filter;
    rebuildUi();
  }
}
