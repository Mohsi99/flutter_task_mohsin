import '../models/bundle_plan.dart';
import '../models/regional_plan.dart';

/// Service that provides mock eSIM bundle data for Turkey.
class BundleService {
  /// Returns the list of local bundles available for Turkey.
  List<BundlePlan> getLocalBundles() {
    return const [
      // Row 1
      BundlePlan(
        id: 'tr_3gb_30d',
        dataAmount: '3',
        dataUnit: 'GB',
        validityDays: 30,
        price: 2.99,
        type: BundleType.standard,
      ),
      BundlePlan(
        id: 'tr_5gb_7d',
        dataAmount: '5',
        dataUnit: 'GB',
        validityDays: 7,
        price: 3.50,
        type: BundleType.standard,
      ),
      BundlePlan(
        id: 'tr_5gb_15d',
        dataAmount: '5',
        dataUnit: 'GB',
        validityDays: 15,
        price: 3.99,
        type: BundleType.standard,
      ),
      // Row 2
      BundlePlan(
        id: 'tr_5gb_30d',
        dataAmount: '5',
        dataUnit: 'GB',
        validityDays: 30,
        price: 4.25,
        type: BundleType.standard,
      ),
      BundlePlan(
        id: 'tr_10gb_10d',
        dataAmount: '10',
        dataUnit: 'GB',
        validityDays: 10,
        price: 5.50,
        type: BundleType.standard,
      ),
      BundlePlan(
        id: 'tr_10gb_15d',
        dataAmount: '10',
        dataUnit: 'GB',
        validityDays: 15,
        price: 5.75,
        type: BundleType.standard,
      ),
      // Row 3
      BundlePlan(
        id: 'tr_20gb_30d',
        dataAmount: '20',
        dataUnit: 'GB',
        validityDays: 30,
        price: 7.48,
        type: BundleType.standard,
      ),
      BundlePlan(
        id: 'tr_unlimited_10d',
        dataAmount: 'Unlimited',
        dataUnit: '',
        validityDays: 10,
        price: 5.50,
        type: BundleType.unlimited,
      ),
    ];
  }

  /// Returns the list of regional/global plans supporting Turkey.
  List<RegionalPlan> getRegionalPlans() {
    return const [
      RegionalPlan(
        id: 'euroconnect',
        name: 'EuroConnect',
        dataAmount: '1 GB',
        validityText: '7 days',
        supportedCountries: 32,
        price: 2.51,
      ),
      RegionalPlan(
        id: 'global_unlimited',
        name: 'Global Unlimited',
        dataAmount: 'Unlimited',
        validityText: '1 day',
        supportedCountries: 34,
        price: 2.99,
      ),
      RegionalPlan(
        id: 'eurolink',
        name: 'EuroLink',
        dataAmount: '1 GB',
        validityText: '7 days',
        supportedCountries: 34,
        price: 2.52,
      ),
      RegionalPlan(
        id: 'worldisyours',
        name: 'worldisyours',
        dataAmount: '1 GB',
        validityText: '1 day',
        supportedCountries: 57,
        price: 3.00,
      ),
    ];
  }
}
