import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  final Function onNavigateToCart;
  const ServicePage({Key? key, required this.onNavigateToCart})
      : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  // Services data
  final List<Service> services = [
    Service(
      name: "Haircut",
      description: "Professional haircut for all styles.",
      price: "LKR 1,500",
      duration: "30 minutes",
      image: "lib/assets/images/haircut.png",
      isSelected: false,
    ),
    Service(
      name: "Beard Trim",
      description: "Get a neat and stylish beard trim.",
      price: "LKR 800",
      duration: "20 minutes",
      image: "lib/assets/images/makeup.png",
      isSelected: false,
    ),
    Service(
      name: "Head Massage",
      description: "Relaxing and refreshing head massage.",
      price: "LKR 1,200",
      duration: "25 minutes",
      image: "lib/assets/images/massage.png",
      isSelected: false,
    ),
    Service(
      name: "Makeup",
      description: "Professional makeup for all occasions.",
      price: "LKR 2,500",
      duration: "45 minutes",
      image: "lib/assets/images/makeup.png",
      isSelected: false,
    ),
  ];

  String selectedLocation = "Sainthamaruthu";
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Services"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Greeting and instruction
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi Joon,",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Pick Whatever Service You Want?",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),

                    // Location and Date Picker
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Location Dropdown
                        Expanded(
                          flex: 1,
                          child: DropdownButtonFormField<String>(
                            value: selectedLocation,
                            decoration: InputDecoration(
                              labelText: "Location",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            items: [
                              "Sainthamaruthu",
                              "Maruthamunai",
                            ]
                                .map((location) => DropdownMenuItem(
                                      value: location,
                                      child: Text(
                                        location,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedLocation = value!;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 10),

                        // Date Picker
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2100),
                              );
                              if (pickedDate != null) {
                                setState(() {
                                  selectedDate = pickedDate;
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 12.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Text(
                                selectedDate == null
                                    ? "Select Date"
                                    : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                                style: TextStyle(
                                    color: selectedDate == null
                                        ? Theme.of(context).hintColor
                                        : Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Services List
                    Column(
                      children: services.map((service) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Card(
                            color: Theme.of(context).cardColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            elevation: 3,
                            child: ExpansionTile(
                              leading: Image.asset(
                                service.image,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              title: Text(
                                service.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                service.price,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  service.isSelected
                                      ? Icons.check_circle
                                      : Icons.circle_outlined,
                                  color: service.isSelected
                                      ? Colors.green
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    service.isSelected = !service.isSelected;
                                  });
                                },
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Duration: ${service.duration}"),
                                      const SizedBox(height: 4),
                                      Text(
                                          "Description: ${service.description}"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                widget.onNavigateToCart;
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "Go to Booking",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Service {
  final String name;
  final String description;
  final String price;
  final String duration;
  final String image;
  bool isSelected;

  Service({
    required this.name,
    required this.description,
    required this.price,
    required this.duration,
    required this.image,
    this.isSelected = false,
  });
}
