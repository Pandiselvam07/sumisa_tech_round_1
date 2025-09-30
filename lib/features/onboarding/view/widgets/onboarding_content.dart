import 'package:flutter/material.dart';
import 'package:sumisatech_round_1/core/constants/app_colors.dart';
import 'package:sumisatech_round_1/core/constants/app_images.dart';
import 'package:sumisatech_round_1/core/constants/app_strings.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 2),
        Text(
          AppStrings.sumisa,
          style: TextStyle(
            fontSize: 14,
            letterSpacing: 4,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 60),
        Image.asset(AppImages.onboarding, height: 225, fit: BoxFit.contain),
        const SizedBox(height: 60),
        const Text(
          AppStrings.onboardingTitle,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          AppStrings.onboardingSubtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
            height: 1.5,
          ),
        ),

        const Spacer(flex: 3),
      ],
    );
  }
}
