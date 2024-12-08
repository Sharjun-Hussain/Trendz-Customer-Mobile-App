import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendz_customer/theming/app_colors.dart'; // Ensure you have Iconsax package installed

class ModernServiceTile extends StatelessWidget {
  const ModernServiceTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [
            AppColors.secondaryGold.withOpacity(0.8), // Light gold color
            AppColors.secondaryGold, // Darker shade
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
      height: 100,
      child: Stack(
        children: [
          // Rounded shapes behind the icon
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
            top: -15,
            right: -15,
            child: Container(
              width: 50,
              height: 50,
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
              padding: const EdgeInsets.all(8.0),
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
              child: const Icon(
                Iconsax.add,
                color: AppColors.secondaryGold,
                size: 24,
              ),
            ),
          ),
          // Centered text for the service
          const Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              "HairCut",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
