import 'package:flutter/material.dart';
import 'package:sumisatech_round_1/core/constants/app_colors.dart';
import 'package:sumisatech_round_1/core/constants/app_strings.dart';
import 'package:sumisatech_round_1/features/onboarding/view/widgets/onboarding_content.dart';
import 'package:sumisatech_round_1/features/onboarding/viewmodel/onboarding_viewmodel.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final OnboardingViewModel _viewModel = OnboardingViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: Column(
            children: [
              const Expanded(child: OnboardingContent()),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: SizedBox(
                  width: 200,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () => _viewModel.onContinuePressed(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.textWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      AppStrings.continueButton,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
