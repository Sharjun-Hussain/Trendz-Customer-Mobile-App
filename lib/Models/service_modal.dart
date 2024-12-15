class Service {
  final String serviceName;
  final int id;
  final String price;
  final String category;
  final String imageUrl;
  final String description;
  final String rating;
  final String duration;

  Service(
      {required this.id,
      required this.category,
      required this.description,
      required this.duration,
      required this.imageUrl,
      required this.price,
      required this.rating,
      required this.serviceName});

  factory Service.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return Service(
        id: data['id'],
        category: data['category'],
        description: data['description'],
        duration: data['duration'],
        imageUrl: data['imageUrl'],
        price: data['price'],
        rating: data['rating'],
        serviceName: data['serviceName']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "serviceName": serviceName,
      "description": description,
      "price": price,
      "rating": rating,
      "imageUrl": imageUrl,
      "duration": duration,
      "category": category,
    };
  }
}
