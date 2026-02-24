import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';

import '../../../models/bundle_plan.dart';
import '../../../models/regional_plan.dart';
import '../../../services/bundle_service.dart';


class CountryDetailViewModel extends BaseViewModel {
  final _bundleService = locator<BundleService>();

  String _selectedFilter = 'All';
  String get selectedFilter => _selectedFilter;

  List<BundlePlan> get allBundles => _bundleService.getLocalBundles();

  List<RegionalPlan> get regionalPlans => _bundleService.getRegionalPlans();

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

  int get bundleCount => filteredBundles.length;


  void setFilter(String filter) {
    _selectedFilter = filter;
    rebuildUi();
  }
}
