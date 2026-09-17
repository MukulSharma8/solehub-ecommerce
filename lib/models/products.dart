class Products {
  final String id;
  final String name;
  final String brand;
  final int price;
  final String category;
  final String image;
  final String description;
  final double rating;
  final List<int> sizes;
  final List<String> gallery;
  final bool isPopular;
  final bool isNewArrival;

  Products({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.category,
    required this.image,
    required this.description,
    required this.rating,
    required this.sizes,
    required this.gallery,
    required this.isPopular,
    required this.isNewArrival,
  });

  Products.fromJson(Map<String, dynamic> json)
      : id = json["_id"],
        name = json["name"],
        brand = json["brand"],
        price = json["price"],
        category = json["category"],
        image = json["image"],
        description = json["description"],
        rating = (json["rating"] as num).toDouble(),
        sizes = List<int>.from(json["sizes"]),
        gallery = List<String>.from(json["gallery"]),
        isPopular = json["isPopular"],
        isNewArrival = json["isNewArrival"];
}