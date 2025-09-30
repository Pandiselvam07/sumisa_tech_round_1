import 'package:flutter/material.dart';
import 'package:sumisatech_round_1/core/constants/app_colors.dart';

class LocationHeader extends StatelessWidget {
  final String location;
  final String pincode;
  final VoidCallback onEditPressed;

  const LocationHeader({
    super.key,
    required this.location,
    required this.pincode,
    required this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.opacBackground),
      child: Row(
        children: [
          const SizedBox(width: 8),
          const Icon(Icons.location_on, color: AppColors.cyan, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location,
                  style: const TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  pincode,
                  style: const TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: onEditPressed,
            child: const Text(
              'Edit',
              style: TextStyle(
                color: AppColors.cyan,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
