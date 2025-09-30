import 'package:flutter/material.dart';
import 'package:sumisatech_round_1/core/model/venue_model.dart';

class VenueDetailViewModel extends ChangeNotifier {
  late VenueModel venue;

  void initialize(VenueModel venueData) {
    venue = venueData;
  }

  void onBookNow() {
  }

  void onBackPressed(BuildContext context) {
    Navigator.pop(context);
  }
}
