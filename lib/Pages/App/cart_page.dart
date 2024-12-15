import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendz_customer/Components/BookingPopup.dart';

class CartPage extends StatefulWidget {
  String selectedLocation; // Default branch
  String selectedDate;
  CartPage(
      {super.key, required this.selectedDate, required this.selectedLocation});

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
  // Default date

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

  void handleBooking() {
    if (widget.selectedDate == "Select Date" ||
        selectedTime == "Not Selected" ||
        selectedServices.isEmpty) {
      // Show error if any field is not selected
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select all fields")),
      );
    } else {
      // Proceed if both fields are valid
      _showConfirmationDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final int totalPrice = selectedServices.fold(
        0,
        (sum, item) =>
            sum + int.parse(item["price"]!.split(' ')[1].replaceAll(',', '')));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cart",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // Services List
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 8,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 15),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       // Location Dropdown
                //       Expanded(
                //         flex: 1,
                //         child: DropdownButtonFormField<String>(
                //           value: selectedLocation,
                //           decoration: InputDecoration(
                //             labelText: "Location",
                //             labelStyle: Theme.of(context).textTheme.bodyMedium,
                //             border: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(8.0),
                //             ),
                //           ),
                //           items: [
                //             "Sainthamaruthu",
                //             "Maruthamunai",
                //           ]
                //               .map((location) => DropdownMenuItem(
                //                     value: location,
                //                     child: Text(
                //                       location,
                //                       style:
                //                           Theme.of(context).textTheme.bodySmall,
                //                     ),
                //                   ))
                //               .toList(),
                //           onChanged: (value) {
                //             setState(() {
                //               selectedLocation = value!;
                //             });
                //           },
                //         ),
                //       ),
                //       const SizedBox(width: 10),

                //       // Date Picker
                //       Expanded(
                //         flex: 1,
                //         child: GestureDetector(
                //           onTap: () async {
                //             DateTime now = DateTime.now();
                //             DateTime threeDaysLater =
                //                 now.add(const Duration(days: 2));

                //             DateTime? pickedDate = await showDatePicker(
                //               context: context,
                //               initialDate: now,
                //               firstDate: now,
                //               lastDate: threeDaysLater,
                //             );

                //             if (pickedDate != null) {
                //               setState(() {
                //                 selectedDate =
                //                     "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                //               });
                //             }
                //           },
                //           child: Container(
                //             padding: const EdgeInsets.symmetric(
                //                 horizontal: 12.0, vertical: 12.0),
                //             decoration: BoxDecoration(
                //               border: Border.all(color: Colors.grey),
                //               borderRadius: BorderRadius.circular(8.0),
                //             ),
                //             child: Text(
                //               selectedDate == null
                //                   ? "Select Date"
                //                   : selectedDate,
                //               style: TextStyle(
                //                 color: selectedDate == null
                //                     ? Theme.of(context).primaryColor
                //                     : Theme.of(context).primaryColor,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
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
                        horizontal: 16.0, vertical: 3.0),
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
                                width: 30,
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(service["name"]!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                  const SizedBox(height: 8),
                                  Text(
                                    service["price"]!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontWeight: FontWeight.w600),
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
                    "Select your preferred time ",
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
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
                      selectedServices.length.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Branch:",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      widget.selectedLocation,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date:",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      widget.selectedDate,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Time Range:",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      selectedTime,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text("Total Amount:",
                        style: Theme.of(context).textTheme.bodySmall),
                    Text(
                      "LKR $totalPrice",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: handleBooking,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    width: double.infinity,
                    height: 60,
                    color: Theme.of(context).primaryColor,
                    child: Center(
                      child: Text(
                        "Confirm",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).cardColor,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Order'),
          content: const Text('Are you sure you want to confirm the order?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return BookingPopup(
                          bookingDate: widget.selectedDate,
                          bookingTime: selectedTime,
                          bookingReference: "SLDD11223452332",
                          bookingNumber: "B0221",
                          onAcknowledge: () => Navigator.of(context).pop());
                    });
              },
              child: Text(
                'Yes',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessAlert(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Order confirmed successfully!'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }
}
