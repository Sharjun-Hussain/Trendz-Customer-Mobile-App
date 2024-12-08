import 'package:flutter/material.dart';
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
  int _selectedPageIndex = 0; // Tracks the currently selected page
  final PageController _pageController =
      PageController(); // Controls the PageView

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
      const HomePage(),
      ServicePage(
        onNavigateToCart: () => _onNavTap(3), // Navigate to CartPage
      ),
      const CartPage(),
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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.design_services), label: "Service"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_online), label: "Booking"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
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
