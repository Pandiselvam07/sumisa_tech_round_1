import 'package:flutter/material.dart';
import 'package:sumisatech_round_1/core/constants/app_colors.dart';
import 'package:sumisatech_round_1/core/constants/app_strings.dart';
import 'package:sumisatech_round_1/core/model/venue_model.dart';
import 'package:sumisatech_round_1/features/venue_detail/view/widgets/book_button.dart';
import 'package:sumisatech_round_1/features/venue_detail/view/widgets/rating_badge.dart';
import 'package:sumisatech_round_1/features/venue_detail/view/widgets/venue_header.dart';
import 'package:sumisatech_round_1/features/venue_detail/viewmodel/venue_detals_viewmodel.dart';

class VenueDetailScreen extends StatefulWidget {
  final VenueModel venue;

  const VenueDetailScreen({super.key, required this.venue});

  @override
  State<VenueDetailScreen> createState() => _VenueDetailScreenState();
}

class _VenueDetailScreenState extends State<VenueDetailScreen> {
  final VenueDetailViewModel _viewModel = VenueDetailViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.initialize(widget.venue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VenueHeader(
                  imageUrl: widget.venue.imageUrl,
                  onBackPressed: () => _viewModel.onBackPressed(context),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.venue.name,
                              style: const TextStyle(
                                color: AppColors.textWhite,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          RatingBadge(rating: widget.venue.rating),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: AppColors.textGrey,
                            size: 18,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            widget.venue.location,
                            style: const TextStyle(
                              color: AppColors.textGrey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        AppStrings.description,
                        style: TextStyle(
                          color: AppColors.textWhite,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.venue.description,
                        style: TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 15,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppStrings.bookSlot,
                        style: TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 15,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BookButton(
              time: widget.venue.bookingTime,
              onPressed: _viewModel.onBookNow,
            ),
          ),
        ],
      ),
    );
  }
}
