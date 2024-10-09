class Product {
  final int id;
  final String title;
  final String category;
  final String imageUrl;
  final String description;
  final bool isFavorite;

  const Product({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.description,
    required this.isFavorite,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      imageUrl: json['image'],
      description: json['description'],
      isFavorite: false,
    );
  }
}
