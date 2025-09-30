import 'package:flutter/material.dart';
import 'package:sumisatech_round_1/core/constants/app_colors.dart';
import 'package:sumisatech_round_1/core/constants/app_strings.dart';
import 'package:sumisatech_round_1/features/home/view/widgets/bottom_nav_bar.dart';
import 'package:sumisatech_round_1/features/home/view/widgets/location_header.dart';
import 'package:sumisatech_round_1/features/home/viewmodel/home_viewmodel.dart';
import 'package:sumisatech_round_1/features/venue_detail/view/widgets/venue_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeViewModel _viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: AppColors.darkBackground,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  AppStrings.appName,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..shader = const LinearGradient(
                        colors: [AppColors.cyan, AppColors.pink],
                      ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                  ),
                ),
              ],
            ),
            const Text(
              AppStrings.tagline,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textGrey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        actions: [
          SizedBox(
            height: 45,
            width: 225,
            child: SearchBar(
              hintText: AppStrings.searchHint,
              hintStyle: WidgetStatePropertyAll(
                const TextStyle(color: AppColors.textGrey, fontSize: 12),
              ),
              leading: const Icon(
                Icons.search_outlined,
                color: AppColors.textGrey,
              ),
              backgroundColor: WidgetStateProperty.all(
                AppColors.opacBackground,
              ),
              elevation: WidgetStateProperty.all(0),
              onTap: () {},
            ),
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                color: AppColors.textWhite,
                onPressed: () {},
              ),
              Positioned(
                right: 12,
                top: 8,
                child: Container(
                  height: 8,
                  width: 8,
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            LocationHeader(
              location: _viewModel.location.address,
              pincode: _viewModel.location.pincode,
              onEditPressed: _viewModel.onEditLocation,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.explore_outlined, color: AppColors.textGrey),
                  SizedBox(width: 8),
                  const Text(
                    AppStrings.discover,
                    style: TextStyle(
                      color: AppColors.textGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      AppStrings.seeAll,
                      style: TextStyle(color: AppColors.cyan, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: _viewModel.discoverVenues.length,
                itemBuilder: (context, index) {
                  final venue = _viewModel.discoverVenues[index];
                  return VenueCard(
                    venue: venue,
                    onTap: () => _viewModel.onVenueTap(context, venue),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.explore_outlined, color: AppColors.textGrey),
                  SizedBox(width: 8),
                  const Text(
                    AppStrings.featuredContent,
                    style: TextStyle(
                      color: AppColors.textGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      AppStrings.seeAll,
                      style: TextStyle(color: AppColors.cyan, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 250,
                child: VenueCard(
                  venue: _viewModel.featuredVenues[0],
                  onTap: () => _viewModel.onVenueTap(
                    context,
                    _viewModel.featuredVenues[0],
                  ),
                  isFeatured: true,
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _viewModel.currentNavIndex,
        onTap: (index) {
          setState(() {
            _viewModel.setNavIndex(index);
          });
        },
      ),
    );
  }
}
