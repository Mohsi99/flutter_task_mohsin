import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/app_text_styles.dart';
import '../../models/cart_item.dart';

/// A widget that displays a single cart item with quantity controls.
///
/// Shows the price, description (data/validity), quantity indicator,
/// increment/decrement buttons, and a remove button.
class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  const CartItemWidget({
    super.key,
    required this.cartItem,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Row(
        children: [
          // Price and description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.bundle.priceText,
                  style: AppTextStyles.cartPrice,
                ),
                const SizedBox(height: 2),
                Text(
                  cartItem.bundle.shortDescription,
                  style: AppTextStyles.cartDescription,
                ),
              ],
            ),
          ),
          // Quantity controls
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Decrement
              _QuantityButton(
                icon: Icons.remove,
                onTap: onDecrement,
              ),
              // Quantity
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'x${cartItem.quantity}',
                  style: AppTextStyles.cartQuantity,
                ),
              ),
              // Increment
              _QuantityButton(
                icon: Icons.add,
                onTap: onIncrement,
              ),
            ],
          ),
          const SizedBox(width: 8),
          // Remove button
          GestureDetector(
            onTap: onRemove,
            child: const Icon(
              Icons.close,
              size: 18,
              color: AppColors.removeIcon,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QuantityButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: AppColors.primaryBlue.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(
          icon,
          size: 16,
          color: AppColors.primaryBlue,
        ),
      ),
    );
  }
}
