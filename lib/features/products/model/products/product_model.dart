class Product {
  final String? id;
  final String productName;
  final String categoryType;
  final String category;
  final int quantity;
  final String brand;
  final double price;
  final int number;
  final String description;
  final String applicable;
  final String offerImage;

  Product({
    this.id,
    required this.productName,
    required this.categoryType,
    required this.category,
    required this.quantity,
    required this.brand,
    required this.price,
    required this.number,
    required this.description,
    required this.applicable,
    required this.offerImage,
  });
}
