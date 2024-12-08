import 'package:flutter/material.dart';
import 'package:trendz_customer/theming/app_colors.dart';

class ServicePage extends StatefulWidget {
  final Function? onNavigateToCart;
  const ServicePage({Key? key, this.onNavigateToCart}) : super(key: key);

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
                            style: Theme.of(context).textTheme.bodyLarge,
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
                              leading: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
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
                                        service.isSelected =
                                            !service.isSelected;
                                      });
                                    },
                                  ),
                                  Image.asset(
                                    service.image,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ],
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
                              trailing: Icon(
                                service.isExpanded
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down,
                              ),
                              onExpansionChanged: (isExpanded) {
                                setState(() {
                                  service.isExpanded = isExpanded;
                                });
                              },
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
                                      Text("${service.description}"),
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
                widget.onNavigateToCart!();
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
  bool isExpanded;

  Service({
    required this.name,
    required this.description,
    required this.price,
    required this.duration,
    required this.image,
    this.isSelected = false,
    this.isExpanded = false,
  });
}
