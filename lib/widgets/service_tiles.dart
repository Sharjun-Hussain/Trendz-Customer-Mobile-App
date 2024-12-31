import 'package:flutter/material.dart';
import 'package:trendz_customer/theming/app_colors.dart'; // Ensure AppColors is implemented correctly

class ModernServiceTile extends StatelessWidget {
  final String serviceName;
  final String price;
  // final IconData? icon;
  final String imageurl;

  const ModernServiceTile(
      {super.key,
      required this.serviceName,
      required this.price,
      // required this.icon,
      required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      // height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        image:
            DecorationImage(image: AssetImage(imageurl), fit: BoxFit.contain),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: Theme.of(context).primaryColor),
        color: Theme.of(context).focusColor,
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
