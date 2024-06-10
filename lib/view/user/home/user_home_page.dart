import 'package:discover/controller/admin_provider.dart';
import 'package:discover/view/admin/container_home.dart';
import 'package:discover/view/user/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:discover/view/user/home/booking_page.dart';
import 'package:discover/view/user/search/search.dart';
import 'package:discover/widgets/popular_package_card.dart';
import 'package:provider/provider.dart';

class UserHomepage extends StatelessWidget {
  const UserHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Positioned(
              child: Image.asset(
                'assets/splash1.img.jpeg',
                height: size.height * 0.5,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  const Text(
                    'Explore the world today',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Discover - take your travel to the next level',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            // onTap: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => const SearchPage(),
                            //     ),
                            //   );
                            // },
                            decoration: const InputDecoration(
                              hintText: 'Search destination',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const Icon(Icons.search),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                  const Text(
                    'Popular Packages in Asia',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 250,
                    child: Consumer<AdminProvider>(
                      builder: (context, value, child) {
                        if (value.isLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (value.searchList.isEmpty &&
                            value.searchController.text.isNotEmpty) {
                          return Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              // child: Center(
                              //     child:
                              //         Image.asset('assets/search_image.png')),
                            ),
                          );
                        } else if (value.searchList.isEmpty) {
                          if (value.allTravelList.isNotEmpty) {
                            final allPackages = value.allTravelList;
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: allPackages.length,
                              itemBuilder: (context, index) {
                                final trip = allPackages[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            BookingDetailScreen(),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      // AllPlaceContainer(
                                      //     size: size,
                                      //     isAdmin: true,
                                      //     travelpackages: trip,
                                      //     value: value,
                                      //     circleAvatarRadius:
                                      //         circleAvatarRadiusFraction),
                                      expandedTripCard(context, trip: trip),
                                      SizedBox(height: size.height * .02),
                                    ],
                                  ),
                                );
                              },
                            );
                          } else {
                            return Center(
                                child: Image.asset('assets/search_image.png'));
                          }
                        } else {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: value.searchList.length,
                            itemBuilder: (context, index) {
                              final trip = value.searchList[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          BookingDetailScreen(),
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    expandedTripCard(context, trip: trip),
                                    SizedBox(height: size.height * .02),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Expanding your trip around the world',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingDetailScreen(),
                          ),
                        );
                      },
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return expandedTripCard(
                            context,
                            // 'Package $index',
                            // 'assets/splash1.img.jpeg',
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Travel beyond the boundary',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 250,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingDetailScreen(),
                          ),
                        );
                      },
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return expandedTripCard(
                            context,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
