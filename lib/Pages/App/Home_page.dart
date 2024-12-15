import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:trendz_customer/Components/elevated_button.dart';
import 'package:trendz_customer/Pages/App/service_view_page.dart';
import 'package:trendz_customer/Providers/theme_provider.dart';
import 'package:trendz_customer/Providers/user_provider.dart';
import 'package:trendz_customer/widgets/Shop_Details.dart';
import 'package:trendz_customer/widgets/service_tiles.dart';

class HomePage extends StatefulWidget {
  final Function? onNavigateToServices;
  final Function? onNavigateToBookings;
  const HomePage(
      {super.key, this.onNavigateToBookings, this.onNavigateToServices});

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<Map<String, dynamic>> services = [
  {
    "serviceName": "Haircut",
    "price": "Rs. 500.00",
    "icon": Iconsax.flash_1,
    "tag": "hero-haircut",
    "image": "lib/assets/images/haircut_service.jpg"
  },
  {
    "serviceName": "Haircut",
    "price": "Rs. 500.00",
    "icon": Iconsax.scissor_1,
    "tag": "hero-scissors",
    "image": "lib/assets/images/haircut_service.jpg"
  },
];

class _HomePageState extends State<HomePage> {
  late Timer _carouselTimer;
  late final PageController _pageController;
  final secureStorage = const FlutterSecureStorage();

  int _currentPage = 0;
  String? _fullName;

  Future<void> _loadUserData() async {
    // Read the full name from SecureStorage
    String? fullName = await secureStorage.read(key: "fullname");

    setState(() {
      _fullName = fullName;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _pageController = PageController(viewportFraction: 0.9);

    // Start a timer to change the page every 2 seconds
    _carouselTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_pageController.hasClients) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage % 3, // Loop through 3 pages
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _carouselTimer.cancel(); // Cancel the timer to avoid memory leaks
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    // final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Welcome, $_fullName!",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => {themeProvider.toggleTheme()},
                          icon: themeProvider.themeMode == ThemeMode.light
                              ? const Icon(Iconsax.moon)
                              : const Icon(Iconsax.sun_1),
                        ),
                        IconButton(
                          onPressed: () => {},
                          icon: const Icon(Iconsax.notification4),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 15, right: 15, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "#SpecialForYou",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    // TextButton(
                    //     onPressed: () => {},
                    //     child: Text(
                    //       "See More",
                    //       style: Theme.of(context).textTheme.headlineSmall,
                    //     ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child: SizedBox(
                  height: 180, // Set the height for the PageView
                  child: PageView(
                    controller: _pageController,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).cardColor,
                          ),
                          width: MediaQuery.sizeOf(context).width - 25,
                          child: Image.asset(
                            "lib/assets/images/offer_1.jpg",
                            fit: BoxFit.cover,
                          )),
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: MediaQuery.sizeOf(context).width - 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).cardColor,
                          ),
                          child: Image.asset(
                            "lib/assets/images/offer_2.jpg",
                            fit: BoxFit.cover,
                          )),
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: MediaQuery.sizeOf(context).width - 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).cardColor,
                          ),
                          child: Image.asset(
                            "lib/assets/images/offer_3.jpg",
                            fit: BoxFit.cover,
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, left: 15, right: 15, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Your Recent Bookings ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          widget.onNavigateToServices!();
                        },
                        child: Text(
                          "All Bookings",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, left: 15, right: 15, bottom: 15),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).cardColor),
                  height: 150,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Currently No Bookings ",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "Book Appoinments to show here",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomElevatedButton(
                          text: "Book Appointment",
                          icon: Icons.sensor_occupied,
                          onPressed: () => {widget.onNavigateToServices!()})
                    ],
                  )),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, left: 15, right: 15, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Services",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () => {widget.onNavigateToServices!()},
                        child: Text(
                          "All Services",
                          style: Theme.of(context).textTheme.headlineSmall,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, left: 15, right: 15, bottom: 5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: services.map((service) {
                      return Row(
                        children: [
                          Hero(
                            tag: service["tag"],
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                      tag: service["tag"],
                                      serviceName: service["serviceName"],
                                      price: service["price"],
                                      imageurl: service["image"],
                                    ),
                                  ),
                                );
                              },
                              child: ModernServiceTile(
                                serviceName: service["serviceName"],
                                price: service["price"],
                                icon: service["icon"],
                                imageurl: service["image"],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                child: Row(
                  children: [
                    Text(
                      "Shop Details ",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const ShopDetails()
            ],
          ),
        ),
      ),
    );
  }
}
