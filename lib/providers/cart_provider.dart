import 'package:flutter/foundation.dart';

import '../models/bundle_plan.dart';
import '../models/cart_item.dart';

/// Provider (ChangeNotifier) that manages the checkout cart state.
///
/// Uses Provider for state management as required by the task.
class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  /// All items currently in the cart.
  List<CartItem> get items => List.unmodifiable(_items);

  /// Whether the cart is empty.
  bool get isEmpty => _items.isEmpty;

  /// Whether the cart has items.
  bool get isNotEmpty => _items.isNotEmpty;

  /// Total number of unique items in the cart.
  int get itemCount => _items.length;

  /// Total price across all cart items.
  double get totalPrice {
    return _items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  /// Formatted total price string.
  String get totalPriceText => 'USD ${totalPrice.toStringAsFixed(1)}';

  /// Check if a specific bundle is in the cart.
  bool containsBundle(BundlePlan bundle) {
    return _items.any((item) => item.bundle.id == bundle.id);
  }

  /// Toggle a bundle in/out of the cart.
  /// If the bundle is already in the cart, remove it. Otherwise, add it.
  void toggleBundle(BundlePlan bundle) {
    final index = _items.indexWhere((item) => item.bundle.id == bundle.id);
    if (index >= 0) {
      _items.removeAt(index);
    } else {
      _items.add(CartItem(bundle: bundle));
    }
    notifyListeners();
  }

  /// Add a bundle to the cart. If already present, increment quantity.
  void addItem(BundlePlan bundle) {
    final index = _items.indexWhere((item) => item.bundle.id == bundle.id);
    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(bundle: bundle));
    }
    notifyListeners();
  }

  /// Remove a bundle completely from the cart.
  void removeItem(String bundleId) {
    _items.removeWhere((item) => item.bundle.id == bundleId);
    notifyListeners();
  }

  /// Increment quantity for a specific bundle in the cart.
  void incrementQuantity(String bundleId) {
    final index = _items.indexWhere((item) => item.bundle.id == bundleId);
    if (index >= 0) {
      _items[index].quantity++;
      notifyListeners();
    }
  }

  /// Decrement quantity for a specific bundle in the cart.
  /// If quantity reaches 0, remove the item.
  void decrementQuantity(String bundleId) {
    final index = _items.indexWhere((item) => item.bundle.id == bundleId);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  /// Clear all items from the cart.
  void clear() {
    _items.clear();
    notifyListeners();
  }
}
