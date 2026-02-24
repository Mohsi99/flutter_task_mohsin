/// Represents a regional or global eSIM data plan.
class RegionalPlan {
  final String id;
  final String name;
  final String dataAmount;
  final String validityText;
  final int supportedCountries;
  final double price;

  const RegionalPlan({
    required this.id,
    required this.name,
    required this.dataAmount,
    required this.validityText,
    required this.supportedCountries,
    required this.price,
  });

  /// Human-readable price text, e.g. "USD 2.51"
  String get priceText => 'USD ${price.toStringAsFixed(2)}';
}
