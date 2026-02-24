import 'bundle_plan.dart';

class CartItem {
  final BundlePlan bundle;
  int quantity;

  CartItem({
    required this.bundle,
    this.quantity = 1,
  });

  double get totalPrice => bundle.price * quantity;
}
