// import 'package:discover/view/user/wishlist.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:discover/view/user/booking/booking_page.dart';
// import 'package:discover/view/user/search/search.dart';
// import 'package:discover/widgets/category_card.dart';

// class Homepage extends StatelessWidget {
//   const Homepage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Stack(
//           children: [
//             Positioned(
//               child: Image.asset(
//                 'assets/splash1.img.jpeg',
//                 height: size.height * 0.5,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 10, vertical: 150),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Explore the world today',
//                     style: TextStyle(
//                       fontSize: 50,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   const Text(
//                     'Discover - take your travel to the next level',
//                     style: TextStyle(fontSize: 17, color: Colors.white),
//                   ),
//                   const SizedBox(height: 20),
//                   Container(
//                     height: 60,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: TextField(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => const SearchPage(),
//                                 ),
//                               );
//                             },
//                             decoration: const InputDecoration(
//                               hintText: 'Search destination',
//                               border: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                         const Icon(Icons.search),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 100),
//                   const Text(
//                     'Popular Packages in Asia',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 16),
//                   SizedBox(
//                     height: 250,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => BookingDetailScreen()));
//                       },
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 4,
//                         itemBuilder: (context, index) {
//                           return expandedTripCard(
//                             context,
//                             'Destination $index',
//                             'assets/splash1.img.jpeg',
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   const Text(
//                     'Expanding your trip around the world',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 16),
//                   SizedBox(
//                     height: 200,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => BookingDetailScreen()));
//                       },
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 4,
//                         itemBuilder: (context, index) {
//                           return popularPackageCard(
//                             context,
//                             '',
//                             'assets/splash1.img.jpeg',
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   const Text(
//                     'Travel beyond the boundary',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 16),
//                   SizedBox(
//                     height: 250,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => BookingDetailScreen()));
//                       },
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 4,
//                         itemBuilder: (context, index) {
//                           return Positioned(
//                             // bottom: IconButton(onPressed: (){}, icon: Icons.favorite),
//                             child: expandedTripCard(
//                               context,
//                               'City $index',
//                               'assets/splash1.img.jpeg',
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:discover/view/user/booking/booking_page.dart';
import 'package:discover/view/user/search/search.dart';
import 'package:discover/widgets/category_card.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

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
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SearchPage(),
                                ),
                              );
                            },
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookingDetailScreen()));
                      },
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return expandedTripCard(
                            context,
                            'Destination $index',
                            'assets/splash1.img.jpeg',
                          );
                        },
                      ),
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
                                builder: (context) => BookingDetailScreen()));
                      },
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return popularPackageCard(
                            context,
                            'Package $index',
                            'assets/splash1.img.jpeg',
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
                                builder: (context) => BookingDetailScreen()));
                      },
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return expandedTripCard(
                            context,
                            'City $index',
                            'assets/splash1.img.jpeg',
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
