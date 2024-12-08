import 'package:flutter/material.dart';
import 'package:trendz_customer/Screens/booking/Cancelled_booking.dart';
import 'package:trendz_customer/Screens/booking/Upcomming_booking.dart';
import 'package:trendz_customer/Screens/booking/completed_booking.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Booking",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          actions: [
            Icon(
              Icons.search,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              width: 8,
            )
          ],
          bottom: TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            tabs: const [
              Tab(
                text: "Upcomming",
              ),
              Tab(
                text: "Completed",
              ),
              Tab(
                text: "Cancelled",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            UpcomingBookingsPage(),
            CompletedBooking(),
            CancelledBookingsPage()
          ],
        ),
      ),
    );
  }
}
