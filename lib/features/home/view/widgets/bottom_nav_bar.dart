import 'package:flutter/material.dart';
import 'package:sumisatech_round_1/core/constants/app_colors.dart';
import 'package:sumisatech_round_1/core/constants/app_strings.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.cardBackground),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: Colors.transparent,
        selectedItemColor: AppColors.cyan,
        unselectedItemColor: AppColors.textGrey,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          buildNavItem(Icons.home_rounded, AppStrings.home, 0),
          buildNavItem(Icons.bookmark_outline, AppStrings.saved, 1),
          buildNavItem(Icons.play_arrow_outlined, AppStrings.playlights, 2),
          buildNavItem(Icons.settings_outlined, AppStrings.settings, 3),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildNavItem(IconData icon, String label, int index) {
    final isSelected = currentIndex == index;

    return BottomNavigationBarItem(
      label: '',
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? AppColors.cyan : AppColors.textGrey),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? AppColors.cyan : AppColors.textGrey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 4),
          if (isSelected)
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.cyan,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
