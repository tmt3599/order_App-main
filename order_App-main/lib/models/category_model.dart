

class Categoris {
  List<Category> items = [];

  Categoris();

  Categoris.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final pelicula =  Category.fromJson(item);
      items.add(pelicula);
    }
  }
}
class Category {
  String? id;
  String? name;
  String? imageUrl;

  Category({
    this.id,
    required this.name,
    required this.imageUrl,
  });

  Category.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
