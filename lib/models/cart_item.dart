import 'bundle_plan.dart';

/// Represents a bundle added to the checkout cart with a quantity.
class CartItem {
  final BundlePlan bundle;
  int quantity;

  CartItem({
    required this.bundle,
    this.quantity = 1,
  });

  /// Total price for this cart item (price × quantity).
  double get totalPrice => bundle.price * quantity;
}
