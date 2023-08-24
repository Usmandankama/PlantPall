class Plant {
  final String name;
  final String imagePath;
  final String size;
  final double price;
  final String category;


  Plant(this.size, this.price, this.category, {required this.name, required this.imagePath});
}