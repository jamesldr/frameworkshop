class ProductModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? image;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.image,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'] is double
        ? json['price']
        : (json['price'] as int).toDouble();
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}
