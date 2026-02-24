import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/app_text_styles.dart';
import '../../models/cart_item.dart';

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
          // Price + Description
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

          // Quantity Pill Counter (Figma Accurate)
          Container(
            width: 86,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: const Color(0xFF122644),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: onDecrement,
                  child: const Icon(
                    Icons.remove,
                    size: 18,
                    color: Color(0xFF122644),
                  ),
                ),
                Text(
                  'x${cartItem.quantity}',
                  style: AppTextStyles.cartQuantity.copyWith(
                    color: const Color(0xFF122644),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: onIncrement,
                  child: const Icon(
                    Icons.add,
                    size: 18,
                    color: Color(0xFF122644),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Remove Button
          GestureDetector(
            onTap: onRemove,
            child: const Icon(
              Icons.close,
              size: 20,
              color: Color(0xffDB4446),
            ),
          ),
        ],
      ),
    );
  }
}