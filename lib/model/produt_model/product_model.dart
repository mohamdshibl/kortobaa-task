class Product {
  int? id;
  String? name;
  String? imageLink;
  String? price;
  String? description;
  String? rate;
  int? q;
  Category? category;

  Product(
      {this.id,
        this.name,
        this.imageLink,
        this.price,
        this.description,
        this.rate,
        this.q,
        this.category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageLink = json['image_link'];
    price = json['price'];
    description = json['description'];
    rate = json['rate'];
    q = json['q'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['image_link'] = imageLink;
    data['price'] = price;
    data['description'] = description;
    data['rate'] = rate;
    data['q'] = q;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? imageLink;

  Category({this.id, this.name, this.imageLink});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageLink = json['image_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['image_link'] = imageLink;
    return data;
  }
}
