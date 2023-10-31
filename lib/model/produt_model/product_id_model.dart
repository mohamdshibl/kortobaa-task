class CategoryId {
  int? id;
  String? name;
  String? imageLink;
  String? price;
  String? description;
  String? rate;
  Category? category;

  CategoryId(
      {this.id,
        this.name,
        this.imageLink,
        this.price,
        this.description,
        this.rate,
        this.category});

  CategoryId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageLink = json['image_link'];
    price = json['price'];
    description = json['description'];
    rate = json['rate'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['image_link'] = imageLink;
    data['price'] = price;
    data['description'] = description;
    data['rate'] = rate;
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