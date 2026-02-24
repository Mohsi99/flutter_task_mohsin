

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

  String get validityText => '$validityDays days';

  String get dataText => '$dataAmount $dataUnit';

  String get priceText => 'USD ${price.toStringAsFixed(2)}';

  String get shortDescription =>
      '$dataAmount $dataUnit / $validityDays Days';
}

enum BundleType {
  standard,
  unlimited,
}
