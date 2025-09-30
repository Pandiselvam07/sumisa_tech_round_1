import 'package:flutter/material.dart';

class OnboardingViewModel extends ChangeNotifier {
  void onContinuePressed(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');
  }
}