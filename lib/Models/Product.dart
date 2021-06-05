import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_universe/Models/Brand.dart';
import 'package:flutter_universe/Models/Category.dart';

class Product {
  final String image, title, description,id,hexColor,categoryTitle;
  final int price,vaultPrice;
  final Categorie category;
  final Brand brand;

  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.vaultPrice,
    this.description,
    this.hexColor,
    this.category,
    this.brand,
    this.categoryTitle
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] as String,
      image: json['image'] as String,
      title: json['title'] as String,
      price: json['price'] as int,
      vaultPrice : json['vaultPrice'] as int,
      description: json['description'] as String,
      hexColor: json['hexColor'] as String,
      categoryTitle:json['category'] as String,
    );
  }

  @override
  String toString() {
    return '$categoryTitle';
  }
}
