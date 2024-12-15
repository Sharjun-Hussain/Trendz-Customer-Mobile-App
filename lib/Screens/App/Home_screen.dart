import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendz_customer/Pages/App/Home_page.dart';
import 'package:trendz_customer/Pages/App/Service_page.dart';
import 'package:trendz_customer/Pages/App/booking_page.dart';
import 'package:trendz_customer/Pages/App/cart_page.dart';
import 'package:trendz_customer/Pages/App/profile_page.dart';
import 'package:trendz_customer/theming/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedDate = "Select Date"; // Shared state for date
  String selectedLocation = ""; //Shared state for branch

  int _selectedPageIndex = 0; // Tracks the currently selected page
  final PageController _pageController =
      PageController(); // Controls the PageView

  void _updateDateAndLocation(String date, String location) {
    setState(() {
      selectedDate = date;
      selectedLocation = location;
    });
  }

  // Navigate to a page using PageView animation
  void _onNavTap(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
    _pageController.jumpToPage(index); // Jump to the specified page
  }

  // Update the selected index when the page changes
  void _onPageChange(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      HomePage(
          onNavigateToBookings: () => _onNavTap(3),
          onNavigateToServices: () => _onNavTap(1)),
      ServicePage(onNavigateToCart: (String date, String location) {
        _updateDateAndLocation(date, location);
        _onNavTap(2); // Navigate to CartPage
      }),
      CartPage(
        selectedDate: selectedDate,
        selectedLocation: selectedLocation,
      ),
      const BookingPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged:
            _onPageChange, // Syncs the BottomNavigationBar with PageView
        children: _pages,
        physics:
            const NeverScrollableScrollPhysics(), // Disables swipe navigation
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.home_2), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.activity4), label: "Services"),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.receipt), label: "My Bookings"),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.frame_1), label: "Profile"),
        ],
        currentIndex: _selectedPageIndex, // Highlights the selected tab
        selectedItemColor: AppColors.gold, // Active tab color
        unselectedItemColor: Colors.grey, // Inactive tab color
        showUnselectedLabels: true, // Show labels for inactive tabs
        onTap: (index) {
          _onNavTap(index); // Navigate to the selected page
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose(); // Dispose of PageController to free resources
    super.dispose();
  }
}
