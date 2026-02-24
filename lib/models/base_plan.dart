abstract class BasePlan {
  String get id;
  String get dataAmount;
  String get validityText;
  double get price;
  
  String get priceText => 'USD ${price.toStringAsFixed(2)}';

  String get shortDescription;
}
