import 'package:flutter/foundation.dart';
import 'package:flutter_universe/Models/Category.dart';
import 'package:flutter_universe/Models/Product.dart';


class Brand {
  final String id,image, title,description;
  final List<Product> products;
  final Categorie category;

  Brand({
    this.id,
    this.image,
    this.title,
    this.description,
    this.products,
    this.category,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {


    return Brand(
      id: json['_id'] as String,
      image: json['image'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }
}
