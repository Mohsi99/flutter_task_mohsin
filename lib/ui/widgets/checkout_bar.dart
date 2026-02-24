import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/app_colors.dart';
import '../common/app_text_styles.dart';
import '../../providers/cart_provider.dart';
import 'cart_item_widget.dart';

/// Sticky bottom bar that shows selected cart items and a checkout button.
///
/// Only visible when the cart has items.
class CheckoutBar extends StatelessWidget {
  const CheckoutBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, _) {
        if (cart.isEmpty) return const SizedBox.shrink();

        return Container(
          decoration: BoxDecoration(
            color: AppColors.cartBarBackground,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Cart items list
                ...cart.items.map(
                  (item) => CartItemWidget(
                    cartItem: item,
                    onIncrement: () =>
                        cart.incrementQuantity(item.bundle.id),
                    onDecrement: () =>
                        cart.decrementQuantity(item.bundle.id),
                    onRemove: () => cart.removeItem(item.bundle.id),
                  ),
                ),
                const SizedBox(height: 8),
                // Checkout button
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        // Checkout action (not implemented — UI only)
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.checkoutGreen,
                        foregroundColor: AppColors.textWhite,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text(
                        '${cart.totalPriceText} - CHECKOUT',
                        style: AppTextStyles.checkoutButtonText,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
