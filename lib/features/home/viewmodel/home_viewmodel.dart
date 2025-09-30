import 'package:flutter/material.dart';
import 'package:sumisatech_round_1/core/constants/app_images.dart';
import 'package:sumisatech_round_1/core/model/location_model.dart';
import 'package:sumisatech_round_1/core/model/venue_model.dart';

class HomeViewModel extends ChangeNotifier {
  int _currentNavIndex = 0;

  final LocationModel _location = LocationModel(
    address: 'Vadakkku Mathivai Road, Perambulur',
    pincode: '621212',
  );

  final List<VenueModel> _discoverVenues = [
    VenueModel(
      id: '1',
      name: 'Gamezone',
      subtitle: '7 Player I Tueds Book now',
      imageUrl: AppImages.cardImg1,
      rating: 4.5,
      playerCount: 2,
      ticket: 1,
      location: 'Chennai Bypass, Perambalur',
      description:
          'Located conveniently along the Chennai Bypass in Perambalur, our turf offers a state-of-the-art space for football and cricket enthusiasts.',
      bookingTime: 'April 22 at 9:00PM',
    ),
    VenueModel(
      id: '2',
      name: 'Arcadia Nights\nPart-II',
      subtitle: '',
      imageUrl: AppImages.cardImg2,
      rating: 4.8,
      playerCount: 4,
      ticket: 1,
      location: 'Chennai Bypass, Perambalur',
      description: 'Experience gaming like never before at Arcadia Nights.',
      bookingTime: 'April 23 at 8:00PM',
    ),
    VenueModel(
      id: '3',
      name: 'Turf Action',
      subtitle: '',
      imageUrl: AppImages.cardImg3,
      rating: 4.5,
      playerCount: 11,
      ticket: 1,
      location: 'Chennai Bypass, Perambalur',
      description:
          'Located conveniently along the Chennai Bypass in Perambalur, our turf offers a state-of-the-art space for football and cricket enthusiasts. Designed with high-quality synthetic grass and optimal lighting, this facility is perfect for both day and night play. Whether you\'re organizing friendly matches, practice sessions, or hosting tournaments, our turf provides the ideal environment with ample parking, seating areas, and easy accessibility.Come play where passion meets performance.Book your slot today!',
      bookingTime: 'April 22 at 9:00PM',
    ),
  ];

  int get currentNavIndex => _currentNavIndex;
  LocationModel get location => _location;
  List<VenueModel> get discoverVenues => _discoverVenues;
  List<VenueModel> get featuredVenues => [_discoverVenues[0]];

  void setNavIndex(int index) {
    _currentNavIndex = index;
    notifyListeners();
  }

  void onEditLocation() {}

  void onVenueTap(BuildContext context, VenueModel venue) {
    Navigator.pushNamed(context, '/venue-detail', arguments: venue);
  }
}
