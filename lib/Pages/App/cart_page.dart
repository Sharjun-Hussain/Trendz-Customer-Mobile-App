import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendz_customer/Components/BookingPopup.dart';
import 'package:trendz_customer/Models/service_modal.dart';
import 'package:trendz_customer/Services/api_services.dart';

class CartPage extends StatefulWidget {
  String selectedLocation; // Default branch
  String selectedDate;
  final List<Services>? selectedServicesFromServicePage;

  CartPage(
      {super.key,
      this.selectedServicesFromServicePage,
      required this.selectedDate,
      required this.selectedLocation});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Services>? cachedCartServices;
  String? saloon_id;
  final ApiService apiService = ApiService();
  final securestorage = FlutterSecureStorage();
  List<Services>? services;
  bool isLoading = true;
  final List<String> timeSlots = [
    "09:00 AM - 11:00 AM",
    "11:00 AM - 01:00 PM",
    "01:00 PM - 03:00 PM",
    "03:00 PM - 05:00 PM",
    "05:00 PM - 07:00 PM",
    "07:00 PM - 09:00 PM"
  ];

  // List<Map<String, String>> selectedServices = [];

  String selectedTime = "Not Selected";
  List<Services> selectedServices = [];
  // Default date

  Future<void> _initializeData() async {
    saloon_id = await securestorage.read(key: "saloon_id");

    // Check if services and shop details are cached in secure storage
    String? cachedServicesData = await securestorage.read(key: "cartservices");
    String? cachedShopDetailsData =
        await securestorage.read(key: "shopDetails");

    if (cachedServicesData != null) {
      // Parse cached data
      List<dynamic> servicesList = json.decode(cachedServicesData);
      cachedCartServices =
          servicesList.map((e) => Services.fromJson(e)).toList();

      // Use cached data if available
      setState(() {
        services = cachedCartServices;

        isLoading = false;
      });
    } else {
      // Fetch and cache data if not already cached
    }
  }

  @override
  void initState() {
    super.initState();
    selectedServices = widget.selectedServicesFromServicePage
            ?.where((service) => service.isSelected ?? false)
            .toList() ??
        [];
    // selectedServices.addAll(services); // Initially select all services
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
    final int totalPrice = selectedServices.fold(0, (sum, service) {
      // Extract numeric price value from string (e.g. "Rs. 1,000" -> 1000)
      return sum + int.parse(service.price.split(".")[0]);
    });
    print(totalPrice);
    print(selectedServices);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Your Cart",
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
                const SizedBox(
                  height: 8,
                ),

                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  child: Text(
                    "You selected services are",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                widget.selectedServicesFromServicePage == null
                    ? const SizedBox(
                        height: 200,
                        child: Center(
                            child: Text("No services available for booking. ")),
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height - 650,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount:
                              widget.selectedServicesFromServicePage?.length ??
                                  0,
                          itemBuilder: (context, index) {
                            final singleservice =
                                widget.selectedServicesFromServicePage?[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width,
                                child: Card(
                                  color: Theme.of(context).cardColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  elevation: 3,
                                  child: ExpansionTile(
                                    leading: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            singleservice!.isSelected!
                                                ? Icons.check_circle
                                                : Icons.circle_outlined,
                                            color: singleservice.isSelected!
                                                ? Colors.green
                                                : Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              singleservice.isSelected =
                                                  !singleservice.isSelected!;
                                              if (singleservice.isSelected!) {
                                                selectedServices
                                                    .add(singleservice);
                                              } else {
                                                selectedServices.removeWhere(
                                                    (service) =>
                                                        service.name ==
                                                        singleservice.name);
                                              }
                                            });
                                          },
                                        ),
                                        Image.asset(
                                          singleservice.icon,
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                    title: Text(
                                      singleservice.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    subtitle: Text(
                                      "Rs. ${singleservice.price} ",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                    ),
                                    trailing: const Icon(Iconsax.arrow_up_2),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                // Time Slot Selection
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    "Select your preferred time ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
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
                                fontSize: 14,
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
            decoration: const BoxDecoration(
              color: Color.fromARGB(96, 124, 123, 123),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
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
          content: const Text('Are you sure to confirm the booking?'),
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
