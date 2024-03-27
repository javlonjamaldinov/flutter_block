class Product {
  final int id;
  final String name;
  final double prise;
  int guantity;
  Product({
    required this.id,
    required this.name,
    required this.prise,
    this.guantity = 0,
  });
}
