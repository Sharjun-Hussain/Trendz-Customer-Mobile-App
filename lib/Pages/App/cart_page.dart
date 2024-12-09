import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Map<String, String>> services = [
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

  final List<String> timeSlots = [
    "09:00 AM - 11:00 AM",
    "11:00 AM - 01:00 PM",
    "01:00 PM - 03:00 PM",
    "03:00 PM - 05:00 PM",
    "05:00 PM - 07:00 PM",
    "07:00 PM - 09:00 PM"
  ];

  List<Map<String, String>> selectedServices = [];
  String selectedTime = "Not Selected";

  @override
  void initState() {
    super.initState();
    selectedServices.addAll(services); // Initially select all services
  }

  void toggleServiceSelection(Map<String, String> service) {
    setState(() {
      if (selectedServices.contains(service)) {
        selectedServices.remove(service);
      } else {
        selectedServices.add(service);
      }
    });
  }

  void selectTime(String timeSlot) {
    setState(() {
      selectedTime = timeSlot;
    });
  }

  @override
  Widget build(BuildContext context) {
    final int totalPrice = selectedServices.fold(
        0,
        (sum, item) =>
            sum + int.parse(item["price"]!.split(' ')[1].replaceAll(',', '')));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        actions: const [
          Text("Sainthamaruthu"),
          SizedBox(width: 30),
          Icon(Iconsax.trash),
          SizedBox(width: 20),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // Services List
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  child: Text(
                    "You selected services are",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ...services.map((service) {
                  final isSelected = selectedServices.contains(service);
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: GestureDetector(
                      onTap: () => toggleServiceSelection(service),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.green.withOpacity(0.2)
                              : Theme.of(context).cardColor,
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
                            Icon(
                              isSelected
                                  ? Icons.check_circle
                                  : Icons.radio_button_unchecked,
                              color: isSelected ? Colors.green : Colors.grey,
                            ),
                            const SizedBox(width: 16),
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
                                        ?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    service["price"]!,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                      final isSelected = selectedTime == timeSlot;
                      return ActionChip(
                        label: Text(
                          timeSlot,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                fontSize: 13,
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                        ),
                        onPressed: () => selectTime(timeSlot),
                        backgroundColor:
                            isSelected ? Colors.green : Colors.grey[200],
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

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(96, 124, 123, 123),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Services:",
                              style: Theme.of(context).textTheme.bodySmall),
                          Text(
                            "${selectedServices.length}",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Booking Date:",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            "12/12/2024",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Booking Time:",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            selectedTime,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Subtotal:",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Theme.of(context).cardColor),
                  ),
                  Text(
                    "LKR $totalPrice",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Theme.of(context).cardColor),
                  ),
                ],
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
