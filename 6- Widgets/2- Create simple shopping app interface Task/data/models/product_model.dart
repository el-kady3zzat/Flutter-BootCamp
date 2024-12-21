class Product {
  late String id;
  late String title;
  late double price;
  late double stock;
  late double rate;
  late bool hasSale;
  late String salePercent;
  late double salePrice;
  late List<dynamic> imgs;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.stock,
    required this.rate,
    required this.hasSale,
    required this.salePercent,
    required this.salePrice,
    required this.imgs,
  });
}
