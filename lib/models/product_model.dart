import 'package:flutter/foundation.dart';

class ProductModel with ChangeNotifier {
  int? id;
  String? title;
  int? price;
  String? description;
  Category? category;
  List<String>? images;

  ProductModel(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.images});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    images = json['images'].cast<String>();
  }
static List<ProductModel> productSnapshot(List snapshot){
  // print("kamrul ${snapshot[0]["images"]}");
    return snapshot.map((data) {

      return ProductModel.fromJson(data);
    }).toList();
}


}

class Category {
  int? id;
  String? name;
  String? image;

  Category({this.id, this.name, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }


}
