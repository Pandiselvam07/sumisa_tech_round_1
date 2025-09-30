import 'package:flutter/material.dart';
import 'package:sumisatech_round_1/core/model/venue_model.dart';
import 'package:sumisatech_round_1/features/home/view/pages/home_screen.dart';
import 'package:sumisatech_round_1/features/onboarding/view/pages/onboarding_screen.dart';
import 'package:sumisatech_round_1/features/venue_detail/view/pages/venue_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playzio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Levenim',
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => OnboardingScreen());
          case '/home':
            return MaterialPageRoute(builder: (context) => const HomeScreen());
          case '/venue-detail':
            final venue = settings.arguments as VenueModel;
            return MaterialPageRoute(
              builder: (context) => VenueDetailScreen(venue: venue),
            );
          default:
            return MaterialPageRoute(builder: (context) => OnboardingScreen());
        }
      },
    );
  }
}
