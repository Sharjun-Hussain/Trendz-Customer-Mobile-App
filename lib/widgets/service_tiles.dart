import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendz_customer/theming/app_colors.dart'; // Ensure AppColors is implemented correctly

class ModernServiceTile extends StatelessWidget {
  final String serviceName;
  final String price;
  final IconData icon;

  const ModernServiceTile({
    super.key,
    required this.serviceName,
    required this.price,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [
            AppColors.secondaryGold,
            AppColors.secondaryGold.withOpacity(0.8), // Lighter shade
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Stack(
        children: [
          // Rounded shape behind the icon
          Positioned(
            top: -15,
            right: -15,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondaryGold.withOpacity(0.6),
              ),
            ),
          ),
          Positioned(
            top: -25,
            right: -25,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondaryGold.withOpacity(0.4),
              ),
            ),
          ),
          // Icon at the top right corner
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Icon(
                icon,
                color: AppColors.black,
                size: 40,
              ),
            ),
          ),
          // Centered text for the service
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  serviceName,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.white),
                ),
                Text(
                  "Price: $price",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
