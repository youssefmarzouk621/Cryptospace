import 'package:flutter/foundation.dart';
import 'package:flutter_universe/Models/Brand.dart';
import 'package:flutter_universe/Models/Product.dart';

class Categorie {
  final String id,image, title,description;
  final List<Product> products;
  final List<Brand> brands;

  Categorie({
    this.id,
    this.image,
    this.title,
    this.description,
    this.products,
    this.brands,
  });

  factory Categorie.fromJson(Map<String, dynamic> json) {


    return Categorie(
      id: json['_id'] as String,
      image: json['image'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }
}
