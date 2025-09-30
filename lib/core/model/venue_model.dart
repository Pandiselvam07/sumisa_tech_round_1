class VenueModel {
  final String id;
  final String name;
  final String subtitle;
  final String imageUrl;
  final double rating;
  final int playerCount;
  final int ticket;
  final String location;
  final String description;
  final String bookingTime;

  VenueModel({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.imageUrl,
    required this.rating,
    required this.playerCount,
    required this.ticket,
    required this.location,
    required this.description,
    required this.bookingTime,
  });
}
