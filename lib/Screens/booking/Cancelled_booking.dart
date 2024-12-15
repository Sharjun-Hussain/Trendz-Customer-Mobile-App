import 'package:flutter/material.dart';

class CancelledBookingsPage extends StatefulWidget {
  @override
  _CancelledBookingsPageState createState() => _CancelledBookingsPageState();
}

class _CancelledBookingsPageState extends State<CancelledBookingsPage> {
  // Sample data for cancelled bookings
  final List<Map<String, dynamic>> cancelledBookings = [
    {
      "reference_no": "REF12345",
      "booking_no": "B001",
      "branch": "Maruthamunai",
      "date_time": "12/12/2024 | 2:00 PM",
      "status": "Cancelled",
      "qr_code": "REF12345-QR",
      "services": ["Haircut", "Shampoo", "Blow-dry"],
    },
    {
      "reference_no": "REF67890",
      "booking_no": "B002",
      "branch": "Maruthamunai",
      "date_time": "15/12/2024 | 1:00 PM",
      "status": "Cancelled",
      "qr_code": "REF67890-QR",
      "services": ["Beard Trim", "Facial"],
    },
    {
      "reference_no": "REF98765",
      "booking_no": "B003",
      "branch": "Sainthamaruthu",
      "date_time": "18/12/2024 | 3:00 PM",
      "status": "Cancelled",
      "qr_code": "REF98765-QR",
      "services": ["Head Massage", "Scalp Treatment"],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Cancelled Bookings',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                  itemCount: cancelledBookings.length,
                  itemBuilder: (context, index) {
                    final booking = cancelledBookings[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      elevation: 4,
                      color: Theme.of(context).cardColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16.0),
                        leading: CircleAvatar(
                          backgroundColor: Colors.red[100],
                          child: Icon(
                            Icons.cancel,
                            color: Colors.red[900],
                          ),
                        ),
                        title: Text(
                          booking["reference_no"]!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${booking["date_time"]}",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "${booking["branch"]}",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        trailing: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.red[800],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            booking["status"]!,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                        onTap: () {
                          _showBookingDetailsDialog(context, booking);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBookingDetailsDialog(
      BuildContext context, Map<String, dynamic> booking) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Booking Details",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  "Reference: ${booking["reference_no"]}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "Branch: ${booking["branch"]}\nDate & Time: ${booking["date_time"]}",
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                const Divider(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Services:",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 5),
                ...booking["services"].map<Widget>((service) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(service),
                      ],
                    ),
                  );
                }).toList(),
                const Divider(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent),
                      child: Text(
                        "Close",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
