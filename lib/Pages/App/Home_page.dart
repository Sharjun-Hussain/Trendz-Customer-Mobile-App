import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:trendz_customer/Components/elevated_button.dart';
import 'package:trendz_customer/Pages/App/Service_page.dart';
import 'package:trendz_customer/Pages/App/booking_page.dart';
import 'package:trendz_customer/Providers/theme_provider.dart';
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

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
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
                      "Welcome, Joon!",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => {themeProvider.toggleTheme()},
                          icon: themeProvider.themeMode == ThemeMode.light
                              ? const Icon(Iconsax.moon)
                              : const Icon(Iconsax.sun),
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
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                        onPressed: () => {},
                        child: Text(
                          "See More",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child: SizedBox(
                  height: 180, // Set the height for the PageView
                  child: PageView(
                    controller: PageController(
                      viewportFraction:
                          0.9, // Controls the size of visible pages
                    ),
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).cardColor,
                        ),
                        width: MediaQuery.sizeOf(context).width - 25,
                        child: const Center(
                          child: Text("Carousel Offer 1"),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: MediaQuery.sizeOf(context).width - 25,
                        color: Theme.of(context).cardColor,
                        child: const Center(
                          child: Text("Carousel Offer 2"),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: MediaQuery.sizeOf(context).width - 25,
                        color: Theme.of(context).cardColor,
                        child: const Center(
                          child: Text("Carousel Offer 3"),
                        ),
                      ),
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
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                        onPressed: () {
                          widget.onNavigateToBookings!();
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
                          onPressed: () => {widget.onNavigateToBookings!()})
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
                      style: Theme.of(context).textTheme.bodyMedium,
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
              const Padding(
                padding:
                    EdgeInsets.only(top: 0.0, left: 15, right: 15, bottom: 5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ModernServiceTile(
                        serviceName: "Haircut",
                        price: "Rs. 500.00",
                        icon: Iconsax.flash_1,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ModernServiceTile(
                        serviceName: "Haircut",
                        price: "Rs. 500.00",
                        icon: Iconsax.scissor_1,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
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
