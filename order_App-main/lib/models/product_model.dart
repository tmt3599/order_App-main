class Products {
  List<Product> items = [];

  Products();

  Products.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final pelicula = Product.fromJson(item);
      items.add(pelicula);
    }
  }
}

class Product {
  String? name;
  int? price;
  String? derc;
  String? imageUrl;
  Object? size;

  Product({
    this.name,
    this.price,
    this.derc,
    this.imageUrl,
    this.size,
  });
  Product.fromJson(Map<String, dynamic> json) {
    name = json["productName"];
    price = json["price"];
    derc = json["description"];
    imageUrl = json["productImg"];
    size = json["size"];
  }

  Map<String, dynamic> toJson() => {
        "productName": name,
        "price": price,
        "description": derc,
        "productImg": imageUrl,
        "size": size,
      };

  toLowerCase() {}
}
