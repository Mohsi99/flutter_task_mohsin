/// Base interface for all eSIM plans (Bundles and Regional/Global).
abstract class BasePlan {
  String get id;
  String get dataAmount;
  String get validityText;
  double get price;
  
  /// Human-readable price text, e.g. "USD 2.99"
  String get priceText => 'USD ${price.toStringAsFixed(2)}';

  /// Short description for cart items
  String get shortDescription;
}
