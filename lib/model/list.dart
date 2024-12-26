class CategoryItem {
  final String name;
  final String imageUrl;
  final List<LaundryItem> items;

  CategoryItem({
    required this.imageUrl,
    required this.name,
    required this.items,
  });
}

class LaundryItem {
  final String name;
  final String imageUrl;
  final double price;
  int quantity;

  LaundryItem({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.quantity = 0,
  });
}

// Pre-defined categories with their items
final List<CategoryItem> categoryData = [
  CategoryItem(
    imageUrl: "assets/page1/tops.png", // Thumbnail for "Tops" category
    name: "TOPS",
    items: [
      LaundryItem(name: "T-shirt", imageUrl: "assets/page1/tshirt.png", price: 0.50),
      LaundryItem(name: "Shirt", imageUrl: "assets/page1/shirt.png", price: 0.50),
      LaundryItem(name: "Blouse", imageUrl: "assets/page1/blouse.png", price: 0.50),
      LaundryItem(name: "Hoodie", imageUrl: "assets/page1/hoodie.png", price: 0.50),
    ],
  ),
  CategoryItem(
    imageUrl: "assets/page1/bottoms.png", // Thumbnail for "Bottoms" category
    name: "BOTTOMS",
    items: [
      LaundryItem(name: "Jeans", imageUrl: "assets/page1/jeans.jpg", price: 0.75),
      LaundryItem(name: "Shorts", imageUrl: "assets/page1/shorts.jpg", price: 0.50),
    ],
  ),
  // Add more categories as needed
];
