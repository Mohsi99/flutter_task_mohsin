
/// Represents a single eSIM data bundle plan.
class BundlePlan {
  final String id;
  final String dataAmount;
  final String dataUnit;
  final int validityDays;
  final double price;
  final BundleType type;

  const BundlePlan({
    required this.id,
    required this.dataAmount,
    required this.dataUnit,
    required this.validityDays,
    required this.price,
    required this.type,
  });

  /// Human-readable validity text, e.g. "30 days"
  String get validityText => '$validityDays days';

  /// Human-readable data text, e.g. "5 GB"
  String get dataText => '$dataAmount $dataUnit';

  /// Human-readable price text, e.g. "USD 2.99"
  String get priceText => 'USD ${price.toStringAsFixed(2)}';

  /// Short description for cart, e.g. "5 GB / 30 Days"
  String get shortDescription =>
      '$dataAmount $dataUnit / $validityDays Days';
}

/// The type category for a bundle.
enum BundleType {
  standard,
  unlimited,
}
