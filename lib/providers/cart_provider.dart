import 'package:flutter/foundation.dart';

import '../models/bundle_plan.dart';
import '../models/cart_item.dart';
import '../models/regional_plan.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  bool get isEmpty => _items.isEmpty;
  bool get isNotEmpty => _items.isNotEmpty;

  int get itemCount => _items.length;

  double get totalPrice {
    return _items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  String get totalPriceText =>
      'USD ${totalPrice.toStringAsFixed(2)}';


  bool containsBundle(BundlePlan bundle) {
    return _items.any((item) => item.bundle.id == bundle.id);
  }

  void toggleBundle(BundlePlan bundle) {
    final index =
    _items.indexWhere((item) => item.bundle.id == bundle.id);

    if (index >= 0) {
      _items.removeAt(index);
    } else {
      _items.add(CartItem(bundle: bundle));
    }

    notifyListeners();
  }

  void addItem(BundlePlan bundle) {
    final index =
    _items.indexWhere((item) => item.bundle.id == bundle.id);

    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(bundle: bundle));
    }

    notifyListeners();
  }

  void removeItem(String bundleId) {
    _items.removeWhere((item) => item.bundle.id == bundleId);
    notifyListeners();
  }

  void incrementQuantity(String bundleId) {
    final index =
    _items.indexWhere((item) => item.bundle.id == bundleId);

    if (index >= 0) {
      _items[index].quantity++;
      notifyListeners();
    }
  }

  void decrementQuantity(String bundleId) {
    final index =
    _items.indexWhere((item) => item.bundle.id == bundleId);

    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }



  bool containsRegionalPlan(RegionalPlan plan) {
    return _items.any((item) => item.bundle.id == plan.id);
  }

  void toggleRegionalPlan(RegionalPlan plan) {
    final index =
    _items.indexWhere((item) => item.bundle.id == plan.id);

    if (index >= 0) {
      _items.removeAt(index);
    } else {
      _items.add(
        CartItem(
          bundle: BundlePlan(
            id: plan.id,
            dataAmount: plan.dataAmount,
            dataUnit: '', // no unit for regional
            validityDays: _extractDays(plan.validityText),
            price: plan.price,
            type: BundleType.standard, // treat as standard
          ),
        ),
      );
    }

    notifyListeners();
  }

  int _extractDays(String validityText) {
    final match = RegExp(r'\d+').firstMatch(validityText);
    return match != null ? int.parse(match.group(0)!) : 0;
  }


  void clear() {
    _items.clear();
    notifyListeners();
  }
}