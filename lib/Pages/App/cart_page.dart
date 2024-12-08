import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> selectedServices = [
      {
        "name": "Haircut",
        "description": "A professional haircut for all styles.",
        "price": "LKR 1,500",
        "image": "lib/assets/images/haircut.png"
      },
      {
        "name": "Beard Trim",
        "description": "Shape and style your beard.",
        "price": "LKR 800",
        "image": "lib/assets/images/makeup.png"
      },
      {
        "name": "Head Massage",
        "description": "Relax with a soothing head massage.",
        "price": "LKR 1,200",
        "image": "lib/assets/images/makeover.png"
      },
    ];

    final String selectedDate = "12/12/2024";
    final String selectedTime = "2:00 PM";
    final int totalPrice = 1500 + 800 + 1200;

    final List<String> timeSlots = [
      "9:00 AM - 11:00 AM",
      "10:00 AM",
      "11:00 AM",
      "12:00 PM",
      "1:00 PM",
      "2:00 PM",
      "3:00 PM",
      "4:00 PM",
      "5:00 PM"
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SilverAppBar
          SliverAppBar(
            expandedHeight: 150,
            pinned: true,
            backgroundColor: Theme.of(context).cardColor,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Cart"),
              centerTitle: true,
              background: Container(
                color: Theme.of(context).primaryColor,
                child: Center(
                  child: Text("Cart"),
                ),
              ),
            ),
          ),
          // Services List
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 16),
                ...selectedServices.map((service) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              service["image"]!,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  service["name"]!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  service["price"]!,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                // Time Slot Selection
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    "Select Time Slot",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: timeSlots.map((timeSlot) {
                      return ActionChip(
                        label: Text(
                          timeSlot,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.black),
                        ),
                        onPressed: () {
                          // Handle time slot selection
                        },
                        backgroundColor: Colors.grey[200],
                      );
                    }).toList(),
                  ),
                ),
                // Booking Summary
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    "Booking Summary",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(96, 124, 123, 123),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 8),
                      Text("Total Services: ${selectedServices.length}"),
                      Text("Booking Date: $selectedDate"),
                      Text("Booking Time: $selectedTime"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "Subtotal: LKR $totalPrice",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Theme.of(context).cardColor),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Function to book the appointment
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).cardColor,
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                "Book Appointment",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
