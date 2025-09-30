import 'package:flutter/material.dart';
import 'package:sumisatech_round_1/core/constants/app_colors.dart';
import 'package:sumisatech_round_1/core/constants/app_strings.dart';
import 'package:sumisatech_round_1/core/model/venue_model.dart';
import 'package:sumisatech_round_1/features/venue_detail/view/widgets/rating_badge.dart';

class VenueCard extends StatelessWidget {
  final VenueModel venue;
  final VoidCallback onTap;
  final bool isFeatured;

  const VenueCard({
    super.key,
    required this.venue,
    required this.onTap,
    this.isFeatured = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isFeatured ? double.infinity : 135,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(venue.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black54],
            ),
          ),
          child: Stack(
            children: [
              if (isFeatured)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: AppColors.textWhite,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.bookmark, color: Colors.red, size: 20),
                  ),
                ),
              Positioned(
                left: 8,
                right: 8,
                bottom: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RatingBadge(rating: venue.rating),
                    const SizedBox(height: 4),
                    Text(
                      venue.name,
                      style: const TextStyle(
                        color: AppColors.textWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    if (isFeatured)
                      Text(
                        ' ${venue.playerCount} Players,${venue.ticket} Ticket, ${AppStrings.bookNow}',
                        style: const TextStyle(
                          color: AppColors.textWhite,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
