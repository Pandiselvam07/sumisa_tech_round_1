import 'package:flutter/material.dart';
import 'package:sumisatech_round_1/core/constants/app_colors.dart';

class VenueHeader extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onBackPressed;

  const VenueHeader({
    super.key,
    required this.imageUrl,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.transparent],
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 16,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 128, 124, 124),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.textWhite),
                onPressed: onBackPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
