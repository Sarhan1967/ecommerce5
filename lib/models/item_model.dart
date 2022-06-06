class ItemModel {
  int id;
  String name;
  String description;
  double price;
  bool inStock;
  String category;
  String imgUrl;

  ItemModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.inStock,
      required this.imgUrl,
      required this.category});
}
