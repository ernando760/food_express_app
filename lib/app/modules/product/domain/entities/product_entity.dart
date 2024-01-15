// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'comment_entity.dart';

class ProductEntity {
  final String? id;
  final String name;
  final String description;
  final String? imgUrl;
  final List<CommentEntity> comments;
  final double price;

  ProductEntity(
      {this.id,
      required this.name,
      required this.description,
      this.imgUrl,
      this.comments = const [],
      required this.price});

  double getAllRatings() => comments
      .map((e) => e.ratings)
      .reduce((value, element) => value + element);

  double getAverageRatings() => getAllRatings() / comments.length;

  ProductEntity copyWith({
    String? id,
    String? name,
    String? description,
    String? imgUrl,
    List<CommentEntity>? comments,
    double? price,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imgUrl: imgUrl ?? this.imgUrl,
      comments: comments ?? this.comments,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'img_url': imgUrl,
      'comments': comments.map((x) => x.toMap()).toList(),
      'price': price,
    };
  }

  factory ProductEntity.fromMap(Map<String, dynamic> map) {
    return ProductEntity(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] as String,
      description: map['description'] as String,
      imgUrl: map['img_url'] != null ? map['img_url'] as String : null,
      comments: List<CommentEntity>.from(
        (map['comments'] as List<dynamic>).map<CommentEntity>(
          (x) => CommentEntity.fromMap(x),
        ),
      ),
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductEntity.fromJson(String source) =>
      ProductEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductEntity(id: $id, name: $name, description: $description, imgUrl: $imgUrl, comments: $comments, price: $price)';
  }

  @override
  bool operator ==(covariant ProductEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.imgUrl == imgUrl &&
        listEquals(other.comments, comments) &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        imgUrl.hashCode ^
        comments.hashCode ^
        price.hashCode;
  }
}
